#  resource "aws_instance" "ZabbixServer-rhel" {
#   ami                    = "ami-0affa25d06329da9e" # RHEL 10
#   instance_type          = "t3.micro"
#   key_name               = "UAEkeypair"
#   vpc_security_group_ids = [aws_security_group.security_group_zabbix.id]

#   tags = {
#     Name = "ZabbixServer-rhel" 
#   }
# }