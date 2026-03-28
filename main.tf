module "dev_infra_app" {
  source = "./module"
  env = "dev"
  bucket_name = "xdevopsman-infra-app-bucket"
  dynamodb_name = "infra_app_db"
  hash_key = "StudentID"
  key_name = "infra-key"
  instance_count = 2
  instance_type = "t3.micro"
  ec2_ami_id = "ami-05d2d839d4f73aafb" #Ubuntu
}

module "prd_infra_app" {
  source = "./module"
  env = "prd"
  bucket_name = "xdevopsman-infra-app-bucket"
  dynamodb_name = "infra_app_db"
  hash_key = "StudentID"
  key_name = "infra-key"
  instance_count = 1
  instance_type = "c7i-flex.large"
  ec2_ami_id = "ami-01c68ee746ed2863d" #RHEL9
}

module "stg_infra_app" {
  source = "./module"
  env = "stg"
  bucket_name = "xdevopsman-infra-app-bucket"
  dynamodb_name = "infra_app_db"
  hash_key = "LockID"
  key_name = "infra-key"
  instance_count = 1
  instance_type = "t3.small"
  ec2_ami_id = "ami-0931307dcdc2a28c9" #AmazonLinux
}