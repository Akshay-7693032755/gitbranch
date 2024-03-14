resource "aws_db_instance" "myrds" {
    engine = "mysql"
    engine_version = "8.0.35"
    allocated_storage = 20
    instance_class = "db.m5d.large"
    storage_type = "gp2"
    username = "admin"
    password = "password000"

    tags =  {
        Name  =  "myrdsdb"
    }
    
  
}