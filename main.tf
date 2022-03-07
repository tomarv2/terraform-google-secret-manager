# Create a slot for the secret in Secret Manager
resource "google_secret_manager_secret" "default" {
  secret_id = var.id == null ? "${var.teamid}-${var.prjid}" : var.id
  labels    = merge(local.shared_labels)
  replication {
    dynamic "user_managed" {
      for_each = length(var.replication_locations) > 0 ? [1] : []
      content {
        dynamic "replicas" {
          for_each = var.replication_locations
          content {
            location = replicas.value
          }
        }
      }
    }
    automatic = length(var.replication_locations) > 0 ? null : true
  }
}

# Store actual secret as the latest version.
resource "google_secret_manager_secret_version" "secret" {
  secret      = google_secret_manager_secret.default.id
  secret_data = var.secret
}
