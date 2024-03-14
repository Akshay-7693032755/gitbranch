output   "vpc_id" {
    description   =   "VPC_ID"
    value   =aws_vps.this_vpc.id
}

output   "public_sub_cidr_block" {
    description  =   "publicsubID"
     value  = aws_subnet.public_sub.id
}