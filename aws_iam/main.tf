provider "aws" {
  region = "us-east-2"
  profile = "rajat-terraform"
  
}


resource "aws_iam_user" "rs1" {
  name = var.user_name
}

resource "aws_iam_policy" "rs2" {
  name = "rajat-admin-policy-1"
  policy = jsonencode({

  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1670147166083",
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
  })
}

resource "aws_iam_user_policy_attachment" "rs3"{
    user = aws_iam_user.rs1.name
    policy_arn =aws_iam_policy.rs2.arn
}