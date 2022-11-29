resource "google_pubsub_topic" "mytopic" {
  name = "handvask"
}

resource "google_cloudbuild_trigger" "pubsub-config-trigger" {
  location    = "europe-north1"
  name        = "pubsub-trigger"
  description = "acceptance test example pubsub build trigger"

  pubsub_config {
    topic = google_pubsub_topic.mytopic.id
  }

  source_to_build {
    uri       = "https://github.com/handvask/handvask"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "cloudbuild.yaml"
    uri       = "https://github.com/handvask/handvask"
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }

  substitutions = {
    _ACTION = "$(body.message.data.action)"
  }

  filter = "_ACTION.matches('INSERT')"
}
