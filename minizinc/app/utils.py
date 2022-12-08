from kubernetes import client
import base64

JOBNAME = lambda id: f"minizinc-job-{id}"


def create_job(
    api_instance: client.BatchV1Api,
    problem: str,
    data: str,
    solvers: list[str],
    id: str,
) -> client.V1Job:
    job_object = _create_job_object(problem, data, solvers, id)
    try:
        return api_instance.create_namespaced_job(body=job_object, namespace="default")
    except:
        return None


def delete_job(api_instance: client.BatchV1Api, id: str) -> bool:
    try:
        api_instance.delete_namespaced_job(
            name=JOBNAME(id),
            namespace="default",
            body=client.V1DeleteOptions(
                propagation_policy="Foreground", grace_period_seconds=0
            ),
        )
        return True
    except:
        return False


def list_pods(api_instance: client.CoreV1Api, job: client.V1Job) -> client.V1PodList:
    try:
        return api_instance.list_namespaced_pod(
            namespace="default",
            label_selector=f'controller-uid={job.metadata.labels["controller-uid"]}',
        )
    except:
        return None


def log_pod(api_instance: client.CoreV1Api, pod: client.V1Pod) -> str:
    try:
        return api_instance.read_namespaced_pod_log(
            name=pod.metadata.name, namespace="default"
        )
    except:
        return None


def _create_job_object(problem: str, data: str, solvers: list[str], id: str):
    solvers_string = "\n".join(solvers)
    # Configurate init container
    print(base64.b64encode(problem.encode("utf-8")))
    init_container = client.V1Container(
        name="init",
        image="docker.io/library/bash",
        command=["bash"],
        args=[
            "-c",
            f'echo "{solvers_string}" > /input/solvers.txt && echo "{base64.b64encode(problem.encode("utf8")).decode("ascii")}" > /input/model.b64.mzn && echo "{base64.b64encode(data.encode("utf8")).decode("ascii")}" > /input/data.b64.dzn',
        ],
        volume_mounts=[client.V1VolumeMount(mount_path="/input", name="input")],
    )
    # Configurate Pod template container
    container = client.V1Container(
        name="minizinc-solver",
        image="jonasplesner/minizinc-solver:latest",
        command=["python", "main.py", id],
        volume_mounts=[client.V1VolumeMount(mount_path="/input", name="input")],
    )
    # Create volume
    volume = client.V1Volume(name="input", empty_dir={})
    # Create and configurate a spec section
    template = client.V1PodTemplateSpec(
        metadata=client.V1ObjectMeta(labels={"name": "minizinc-pod"}),
        spec=client.V1PodSpec(
            restart_policy="Never",
            init_containers=[init_container],
            containers=[container],
            volumes=[volume],
        ),
    )
    # Create the specification of deployment
    spec = client.V1JobSpec(
        completions=len(solvers),
        parallelism=len(solvers),
        completion_mode="Indexed",
        template=template,
    )
    # Instantiate the job object
    job = client.V1Job(
        api_version="batch/v1",
        kind="Job",
        metadata=client.V1ObjectMeta(name=JOBNAME(id)),
        spec=spec,
    )

    return job
