variable "env" {
  description = "This is the environment of infra app"
  type = string
}

variable "bucket_name" {
  description = "This is the bucket name for s3 infra app"
  type = string
}

variable "dynamodb_name" {
  description = "This is the name of dynamodb for infra app"
  type = string
}

variable "hash_key" {
  description = "This is the has key for dynamodb table"
  type = string
}

variable "key_name" {
  description = "This is the key name for keypair in EC2"
  type = string  
}

variable "instance_count" {
  description = "This is the instance count for EC2 instance"
  type = number
}

variable "instance_type" {
  description = "This is the instance type required for ec2  instance"
  type = string
}

variable "ec2_ami_id" {
  description = "This is the ami id for ec2 instance"
  type = string
}
