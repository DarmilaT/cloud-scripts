variable "project_id" {
  type        = string
  description = "A unique ID for the project"
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

variable "region" {
  type    = string
}