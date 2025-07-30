module "projects" {
    source = "./projects"

    project_name        = var.project_name
    project_id          = var.project_id
    billing_account_id = var.billing_account_id
}

module "compute" {
    source = "./compute"

    project_id = var.project_id
}

module "networks" {
    source = "./networks"

    project_id = var.project_id
    vpc_name   = var.vpc_name
    subnet_name = var.subnet_name   
    ip_cidr_range = var.ip_cidr_range
    region     = var.region
}