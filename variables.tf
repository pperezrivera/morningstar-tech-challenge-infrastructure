variable vpc_cidr{
    description = "CIDR block for VPC"
    type = string
    default = "10.0.0.0/16"
}

variable first_availability_zone{ 
    description = "One of the two availability zones in us-east-2"
    type = string
    default = "us-east-2a"
}

variable second_availability_zone{ 
    description = "One of the two availability zones in us-east-2"
    type = string
    default = "us-east-2b"
}