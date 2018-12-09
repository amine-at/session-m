variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-west-1 = "ami-09693313102a30b2c"
  }
}
variable "vpc_at" {
  description = "VPC"
  default = "vpc-3178b557"
}variable "subnet_1" {
  description = "Public Subnet 1"
  default = "subnet-01fcee5a"
}
variable "subnet_2" {
  description = "Public Subnet 2"
  default = "subnet-1fa66257"
}
