#define the provider
provider "aws" {
  region = var.region
}

#create new user iam on aws
resource "aws_iam_user" "admin-user"{
    name = var.iam_user
    tags = {
        description = "Admin user"
    }
}

#create new policy for user
resource "aws_iam_policy" "adminUser" {
    name = "adminUser"
    description = "Allow full access to all resources"
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}

resource "aws_iam_policy_attachment" "adminUser" {
    name = "adminUser"
    users = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
  
}

output "iam_user" {
    value = aws_iam_user.admin-user.name
}

output "iam_policy" {
    value = aws_iam_policy.adminUser.arn
}

output "iam_policy_attachment" {
    value = aws_iam_policy_attachment.adminUser.name
}