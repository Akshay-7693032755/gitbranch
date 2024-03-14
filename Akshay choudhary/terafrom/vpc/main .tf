
provider "aws" {
  region     = "ap-northeast-2"
  access_key = "AKIAVRUVVJO3NDXFJPNR"
  secret_key = "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"
}



#create vpc
resource  "aws_vpc"  "my_vpc"{
 cidr_block  =   var.aws_vps_cidr_block//"26.11.0.0./16"
tags  = {
    Name  = var.aws_vpc_tags//"my_vpc"
}

}

#create public subnet
resource "aws_subnet" "public_sub" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.public_sub_cidr_block//"26.11.0.0/17"
    tags ={
        Name = var.public_sub_tags//"public_subnet"
    } 
    map_public_ip_on_launch = var.public_sub_Mapping //true      #to give internet access
}


#create private subnet
resource "aws_subnet" "private_sub" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.private_sub_cidr_block//"26.11.128.0/18"
    tags ={
        Name = var.private_sub_tags//"public_subnet"
    } 
    map_public_ip_on_launch = var.private_sub_Mapping //false
}

#create private 2 subnet
resource "aws_subnet" "private2_sub" {
    vpc_id = aws_vpc.this_vpc.id
    cidr_block = var.private2_sub_cidr_block//"26.11.0.0/17"
    tags ={
        Name = var.private_sub_tags//"public_subnet"
    } 
    map_public_ip_on_launch = var.private2_sub_Mapping //false
}


#route table create 
resource  =   "aws_default_route_table"   " this_d_rt"{
    aws_default_route_table_id  = aws_this_vpc.this_vpc.default_route_table_id
//aws_vpc.this_vpc.id
route  {
    cidr_block  ="0.0.0.0/0"
    gateway_id  = aws_internet_gateway .IGW.id
}
 tags   =  { var.aws_default_route_table_tags
 }
}

#create internet gatway
resource "aws_internet_gateway " "IGW" {
    vpc_id  =  aws_vpc.aws_this_vpc.vpc_id
    tags  = {
        Name  = var.aws_internet_gateway_tags 
    }
}

#create subnet assocation  route table
resource "aws_route_table_association"  "this rta" {
    subnet_id   =  aws-subnet.public_sub.id
    route_table_id  =  aws_default_route_tabl.this_d_rt.id
}

