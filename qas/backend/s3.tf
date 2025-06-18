#OBRIGATÓRIO! NÃO ALTERAR!
#Bucket S3 que contém o State dos templates Terraform.

module "s3_terraform_state" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket = "tf-state-${local.backend_name_prefix}-${local.account_id}"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

#Política: SSLOnlyRequest
data "aws_iam_policy_document" "iam_policy_document_bucket_state" {
  statement {
    sid = "SSLOnlyRequest"
    principals {
      type = "*"
      identifiers = ["*"]
    }
    effect = "Deny"

    actions = ["s3:*"]

    resources = [
      "${module.s3_terraform_state.s3_bucket_arn}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_policy" "iam_policy_bucket_state" {
  bucket = module.s3_terraform_state.s3_bucket_id
  policy = data.aws_iam_policy_document.iam_policy_document_bucket_state.json
}