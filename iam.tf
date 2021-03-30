# Allow the supplied accounts to read the secret value from Secret Manager
# Note: this module is non-authoritative and will not remove or modify this role
# from accounts that were granted the role outside this module.
resource "google_secret_manager_secret_iam_member" "secret" {
  for_each  = toset(var.accessors)
  project   = var.gcp_project
  secret_id = google_secret_manager_secret.default.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = each.value
}