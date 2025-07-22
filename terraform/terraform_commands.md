# Terraform Commands

### Terraform workflow

terraform init # Initialize the project (downloads AWS plugin)
terraform plan # See what will be created
terraform apply # Apply the changes (create the instance)
terraform destroy # Remove resources

_Delete a specific instance_
`terraform destroy -target='aws_instance.demoServer-rhel'`
