provider "aws" {
  region = var.region
}

resource "aws_iam_user" "admin-user"{
    name = var.iam_user
    tags = {
        description = "Admin user"
    }
}

output "iam_user" {
    value = aws_iam_user.admin-user.name
}