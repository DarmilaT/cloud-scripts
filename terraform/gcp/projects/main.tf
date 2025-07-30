resource "google_project" "my_project" {
  name       = var.project_name
  project_id = var.project_id
  org_id     = null # No organization
}