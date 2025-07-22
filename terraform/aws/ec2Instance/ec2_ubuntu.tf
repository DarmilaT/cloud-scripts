resource "aws_instance" "GrafanaServer_ubuntu" {
  ami                    = "ami-0cfac8ef59a421fab" # Ubuntu 22.04 LTS 
  instance_type          = "t3.micro"
  key_name               = "UAEkeypair"
  vpc_security_group_ids = [aws_security_group.security_group_zabbix.id]

  tags = {
    Name = "GrafanaServer_ubuntu" 
  }
}

resource "aws_instance" "ZabbixServer_ubuntu" {
  ami                    = "ami-0cfac8ef59a421fab" # Ubuntu 22.04 LTS 
  instance_type          = "t3.micro"
  key_name               = "UAEkeypair"
  vpc_security_group_ids = [aws_security_group.security_group_zabbix.id]

  tags = {
    Name = "ZabbixServer_ubuntu" 
  }
}

resource "aws_instance" "ZabbixAgent_ubuntu" {
  ami                    = "ami-0cfac8ef59a421fab" # Ubuntu 22.04 LTS 
  instance_type          = "t3.micro"
  key_name               = "UAEkeypair"
  vpc_security_group_ids = [aws_security_group.security_group_zabbix.id]

  tags = {
    Name = "ZabbixAgent_ubuntu" 
  }
}