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

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "ip_cidr_range" {
  type        = string
  description = "The primary IP CIDR range for the subnet"
}

variable "billing_account_id" {
  type        = string
  description = "ID of the billing account to associate with the project"
}