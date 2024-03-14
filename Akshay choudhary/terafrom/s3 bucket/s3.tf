#Create S3 Bucket Using Terraform
resource "aws_s3_bucket" "my-bucket-Terraform" {
  bucket = "bucketptetet"

  tags = {
    Name        = "AC_bucket"
  }
}
