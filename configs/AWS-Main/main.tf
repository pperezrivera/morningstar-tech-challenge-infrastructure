locals{

}

## need to create the vpc, subnets, internet gateway

################
## AWS VPC
resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        name = "main"
        
    }
}

resource "aws_subnet" "subnet" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 16, 1)
    map_public_ip_on_launch = true
    availability_zone       = var.first_availability_zone

    depends_on = [ aws_vpc.main ]
}

resource "aws_subnet" "subnet" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 16, 2)
    map_public_ip_on_launch = true
    availability_zone       = var.second_availability_zone

    depends_on = [ aws_vpc.main ]
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main.id
    tags = {
        name = "internet_gateway"
    }
}