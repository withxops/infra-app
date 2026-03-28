resource "aws_key_pair" "connect_key" {
  key_name = "${var.env}-${var.key_name}"
  public_key = file("terrakey.pub")
}

resource "aws_default_vpc" "default_vpc" {
}
  
resource "aws_security_group" "infra_sg" {
    name = "${var.env}-infra-app-sg"
    description = "${var.env}-infra-app-sg"
    vpc_id = aws_default_vpc.default_vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allowing ssh from anywhere"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
       description = "allowing http"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
       description = "allowing all"
    }
    tags = {
      Name = "${var.env}-infra-app-sg"
      Environment = "${var.env}"
    }

}

resource "aws_instance" "ec2_instance" {
    count = var.instance_count
    key_name = aws_key_pair.connect_key.key_name
    instance_type = var.instance_type
    ami = var.ec2_ami_id
    security_groups = [aws_security_group.infra_sg.name]

  root_block_device {
    volume_size = var.env == "prd" ? 12 : 10
    volume_type = "gp3"
  }

tags = {
  Name = "${var.env}-infra-app-instance-${count.index + 1}"
  Environment= var.env
}
}