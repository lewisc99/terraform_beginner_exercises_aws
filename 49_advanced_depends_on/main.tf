resource "aws_iam_role" "role" {
  name = "role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "policy" {
  name = "policy"
  role = aws_iam_role.role.name
  policy = jsonencode({
    "Statement" = [{
      "Action" = "s3:*",
      "Effect" = "Allow",
    }],
  })
}

resource "aws_instance" "example" {
  ami = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  depends_on = [
    aws_iam_role_policy.policy,
  ]
}