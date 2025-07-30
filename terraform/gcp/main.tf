module "projects" {
    source = "./projects"

    project_name        = var.project_name
    project_id          = var.project_id
}

module "compute" {
    source = "./compute"

    project_id = var.project_id
}