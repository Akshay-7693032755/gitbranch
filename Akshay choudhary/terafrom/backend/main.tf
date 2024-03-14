provider "aws" {
    region = "ap-northeast-2"
    shared_credentials_files = ["/home/akshay/.aws/credentials"]
    profile = "akshay"
  
}


terraform {
  backend "s3" {
    bucket = "abcbatch24"
    key = "terraform.tfstate"
    dynamodb_table = "cbz24"
    region = "ap-northeast-2"
    profile = "akshay"
    shared_credentials_files = [ "/home/akshay/.aws/credentials" ]

  }
}
