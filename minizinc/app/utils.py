from kubernetes import client
from typing import Tuple


def create_job( api_instance: client.BatchV1Api, problem: str, data: str, solvers: list[str] ) -> client.V1Job:
    job_object = _create_job_object( problem, data, solvers )
    try:
        return api_instance.create_namespaced_job(
            body=job_object,
            namespace='default'
        )
    except:
        return None


def delete_job( api_instance: client.BatchV1Api, job: client.V1Job ) -> bool:
    try:
        api_instance.delete_namespaced_job(
            name=job.metadata.name,
            namespace='default',
            body=client.V1DeleteOptions(
                propagation_policy='Foreground',
                grace_period_seconds=0)
        )
        return True
    except:
        return False


def get_result( api_instance: client.CoreV1Api, job: client.V1Job ) -> Tuple[str, int]:
    pods: client.V1PodList
    try:
        pods = api_instance.list_namespaced_pod(
            namespace='default',
            label_selector=f'controller-uid={job.metadata.labels["controller-uid"]}'
        )
    except Exception as e:
        return "\nCouldn't find job", 400

    for item in pods.items:
        try:
            result = api_instance.read_namespaced_pod_log(
                name=item.metadata.name,
                namespace='default'
            )
            return f'\nGot result:\n{result}', 200
        except:
            pass
    
    return "\nCouldn't get result", 500


def _create_job_object( problem: str, data: str, solvers: list[str] ):
    solver_string = '\n'.join( solvers )
    # Configurate init container
    init_container = client.V1Container(
        name='init',
        image='docker.io/library/bash',
        command=[ "bash" ],
        args=[
            "-c",
            f'echo "{solver_string}" > /input/solvers.txt && echo "{problem}" > /input/model.mzn && echo "{data}" > /input/data.dzn'
        ],
        volume_mounts=[client.V1VolumeMount( mount_path='/input', name='input' )]
    )
    # Configurate Pod template container
    container = client.V1Container(
        name='minizinc-solver',
        image='jonasplesner/minizinc-solver:latest',
        #command=[ "bash", "-c", "ls /input/" ],
        #command=[ "minizinc", "--solvers" ],
        command=[ "python", "main.py" ],
        volume_mounts=[client.V1VolumeMount( mount_path='/input', name='input' )]
    )
    # Create volume
    volume = client.V1Volume( name='input', empty_dir={} )
    # Create and configurate a spec section
    template = client.V1PodTemplateSpec(
        metadata=client.V1ObjectMeta(labels={'name': 'minizinc-job'}),
        spec=client.V1PodSpec(restart_policy='Never', init_containers=[init_container], containers=[container], volumes=[volume])
    )
    # Create the specification of deployment
    spec = client.V1JobSpec(
        completions=len(solvers),
        parallelism=len(solvers),
        completion_mode="Indexed",
        template=template
    )
    # Instantiate the job object
    job = client.V1Job(
        api_version='batch/v1',
        kind='Job',
        metadata=client.V1ObjectMeta(name='minizinc-job'),
        spec=spec
    )

    return job