resource "aws_instance" "ZabbixAgent_windows" {
  ami                    = "ami-0edc976c8fd7cc3ab" # Example: Windows Server 2025 Base
  instance_type          = "t3.micro"
  key_name               = "UAEkeypair"
  vpc_security_group_ids = [aws_security_group.security_group_windows.id]

  tags = {
    Name = "ZabbixAgent_windows"
  }

  # Required for Windows
  get_password_data = true
}
