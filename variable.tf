variable "TravelMemoryApp" {
    description = "This resource belongs to Travel Memory App"
    type = string
    default = "Travel-Memory-App"
}

variable "ImageId" {
    description = "Image id for EC2 instance"
    type = string
    default = "ami-0206f4f885421736f"
}

variable "instanceType" {
    description = "Instance type for EC2 instance"
    type = string
    default = "t2.micro"
}