variable "ami_value" {
  default = ""
}

variable "instance_type_value" {
  default = "t2.medium"
}

variable "kubernetes_version" {
  default     = 1.30
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "us-east-2"
  description = "aws region"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "Public_Subnets CIDR"
  type        = list(string)
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "Private_Subnets CIDR"
  type        = list(string)
}
