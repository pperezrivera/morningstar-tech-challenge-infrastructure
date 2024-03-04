# terraform {
#   cloud {
#     organization = "morningstar_tech_challenge"

#     workspaces {
#       name = "tech_challenge"
#     }
#   }
# }

# ################
# ## AWS VPC
# resource "aws_vpc" "main" {
#     cidr_block           = var.vpc_cidr
#     enable_dns_hostnames = true
#     tags = {
#         name = "main"
        
#     }
# }

# resource "aws_subnet" "subnet_1" {
#     vpc_id                  = aws_vpc.main.id
#     cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 16, 1)
#     map_public_ip_on_launch = true
#     availability_zone       = var.first_availability_zone

#     depends_on = [ aws_vpc.main ]
# }

# resource "aws_subnet" "subnet_2" {
#     vpc_id                  = aws_vpc.main.id
#     cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 16, 2)
#     map_public_ip_on_launch = true
#     availability_zone       = var.second_availability_zone

#     depends_on = [ aws_vpc.main ]
# }

# resource "aws_internet_gateway" "internet_gateway" {
#     vpc_id = aws_vpc.main.id
#     tags = {
#         name = "internet_gateway"
#     }
# }

    terraform {
      backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "example-organization"

        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "example-workspace"
        }
      }
    }

    # An example resource that does nothing.
    resource "null_resource" "example" {
      triggers = {
        value = "A example resource that does nothing!"
      }
    }
