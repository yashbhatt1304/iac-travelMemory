output "tm-vpc" {
  description = "This is Travel Memory VPC"
  value = aws_vpc.tm_vpc.id
}

output "tm-nacl" {
  value = aws_default_network_acl.tm_nacl.id
}

output "tm-public-subnet" {
  value = aws_subnet.tm_pub_subnet.id
}

output "tm-private-subnet" {
  value = aws_subnet.tm_pub_subnet.id
}

output "tm-igw" {
  value = aws_internet_gateway.tm_igw.id
}

output "tm-route-table" {
  value = aws_route_table.tm_route_table.id
}

output "tm-security-group" {
  value = aws_security_group.tm_security_group.id
}