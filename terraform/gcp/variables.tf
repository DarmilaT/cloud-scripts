variable "project_name" {
  type        = string
  description = "The display name of the project"
}

variable "project_id" {
  type        = string
  description = "A unique ID for the project"
}

variable "region" {
  type    = string
  default = "us-central1"
}