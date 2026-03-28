resource "aws_dynamodb_table" "my_dynamodb" {
  name = "${var.env}-${var.dynamodb_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "${var.hash_key}"
  depends_on = [ aws_s3_bucket.my_bucket ]

  attribute {
    name = "${var.hash_key}"
    type = "S"
  }

  tags = {
    Name = "${var.env}-${var.dynamodb_name}"
    Environment = "${var.env}"
  }
}