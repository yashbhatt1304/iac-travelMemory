output "tm-vpc" {
    description = "VPC for Travel Memory"
    value = aws_vpc.tm_vpc.id
}

output "tm-nacl" {
    description = "NAC for Travel Memory"
    value = aws_default_network_acl.tm_nacl.id
}

output "tm-public-subnet" {
    description = "Public Subnet for Travel Memory"  
    value = aws_subnet.tm_pub_subnet.id
}

output "tm-private-subnet" {
    description = "Private Subnet for Travel Memory"
    value = aws_subnet.tm_pub_subnet.id
}

output "tm-igw" {
    description = "Internet Gateway for Travel Memory"
    value = aws_internet_gateway.tm_igw.id
}

output "tm-route-table" {
    description = "Route Table for Travel Memory"
    value = aws_route_table.tm_route_table.id
}

output "tm-security-group" {
    description = "Security Group for Travel Memory"
    value = aws_security_group.tm_security_group.id
}

output "tm-ec2-instance" {
    description = "EC2 for Travel Memory"
    value = aws_instance.tm-ec2.id
}

output "tm-launch-template" {
    description = "Launch Template for Travel Memory"
    value = aws_launch_template.tm_launch_template.id
}

output "tm-autoscaling-group" {
    description = "ASG for TravelMemory"
    value = aws_autoscaling_group.tm_autoscaling_group.id
}

output "tm-load-balancer" {
    description = "Load Balancer for Travel Memory"
    value = aws_lb.tm_load_balancer.id
}

output "tm-autoscaling-attach-lb" {
    description = "Attaching Load balancer to ASG"
    value = aws_autoscaling_attachment.tm_autoscaling_attachement.id
}