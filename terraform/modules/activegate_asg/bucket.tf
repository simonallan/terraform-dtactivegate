resource "aws_kms_key" "mykey" {
  description             = "his key is used to encrypt ssh key objects for activegate host held in s3 bucket"
  deletion_window_in_days = 10

  # policy = "${data.aws_iam_policy_document.mykmspolicy.json}"
}


# data "aws_iam_policy_document" "mykmspolicy" {
#   policy_id        = "key-default-1"
#   statement {
#     actions = ["kms:*"]
#     resources = ["*"]
#     sid       = "Enable IAM User Permissions"
#     principals {
#       type        = "AWS"
#       identifiers = [
#         "${aws_iam_role.s3-eip-ssm.arn}"
#       ]
#     }
#   }
# }

resource "aws_s3_bucket" "activegate" {
  bucket_prefix = var.s3_bucket_prefix
  acl           = "private"

  tags = {
    Name      = var.prefix
    Terraform = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
