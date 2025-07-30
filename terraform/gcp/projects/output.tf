output "project_id" {
  description = "The ID of the newly created GCP project"
  value       = google_project.my_project.project_id
}
