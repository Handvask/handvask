import base64
from typing import Iterable

from kubernetes import client

JOBNAME = lambda id, solver: f"minizinc-job-{id}-{solver}"


def create_jobs(
    api_instance: client.BatchV1Api,
    problem: str,
    data: str,
    solvers: list[str],
    id: str,
    image_name: str,
    objective: bool,
    json: bool,
    processors: int,
    all: bool
) -> client.V1Job:
    for job_object in _create_job_objects(problem, data, solvers, id, image_name, objective, json, processors, all):
        try:
            api_instance.create_namespaced_job(body=job_object, namespace="default")
        except Exception as e:
            print(f"Got exception while creating job: {e}")
            return None

    return True


def delete_jobs(api_instance: client.BatchV1Api, names: Iterable[str]) -> bool:
    success = True

    for name in names:
        try:
            if (
                api_instance.delete_namespaced_job(
                    name=name,
                    namespace="default",
                    body=client.V1DeleteOptions(
                        propagation_policy="Foreground", grace_period_seconds=0
                    ),
                )
                is None
            ):
                success = False
        except:
            success = False

    return success


def list_jobs(api_instance: client.BatchV1Api, id: str) -> client.V1JobList:
    try:
        return api_instance.list_namespaced_job(
            namespace="default", label_selector=f"jobgroup={id}"
        )
    except:
        return None


def _create_job_objects(
    problem: str, data: str, solvers: list[str], id: str, image_name: str,
    objective: bool, json: bool, processors: int, all: bool
):
    jobs = []
    # Configurate init container
    init_container = client.V1Container(
        name="init",
        image="docker.io/library/bash",
        command=["bash"],
        args=[
            "-c",
            f'echo "{base64.b64encode(problem.encode("utf8")).decode("ascii")}" > /input/model.b64.mzn && echo "{base64.b64encode(data.encode("utf8")).decode("ascii")}" > /input/data.b64.dzn',
        ],
        volume_mounts=[client.V1VolumeMount(mount_path="/input", name="input")],
    )
    # Create volume
    volume = client.V1Volume(name="input", empty_dir={})

    for solver in solvers:
        # Configurate Pod template container
        container = client.V1Container(
            name="minizinc-solver",
            image=image_name,
            image_pull_policy="IfNotPresent",
            command=["python"], 
            args=[
                "main.py", id, solver,
                "-o" if objective else "",
                "-j" if json else "",
                "-p", str(processors),
                "-a" if all else ""
            ],
            volume_mounts=[client.V1VolumeMount(mount_path="/input", name="input")],
            resources={"limits": {"cpu": "300m", "memory": "512Mi"}},
        )
        # Create and configurate a spec section
        template = client.V1PodTemplateSpec(
            metadata=client.V1ObjectMeta(
                labels={"name": "minizinc-pod", "jobgroup": id}
            ),
            spec=client.V1PodSpec(
                restart_policy="Never",
                init_containers=[init_container],
                containers=[container],
                volumes=[volume],
            ),
        )
        # Create the specification of deployment
        spec = client.V1JobSpec(
            template=template,
        )
        # Instantiate the job object
        job = client.V1Job(
            api_version="batch/v1",
            kind="Job",
            metadata=client.V1ObjectMeta(
                name=JOBNAME(id, solver), labels={"jobgroup": id}
            ),
            spec=spec,
        )
        jobs.append(job)

    return jobs
