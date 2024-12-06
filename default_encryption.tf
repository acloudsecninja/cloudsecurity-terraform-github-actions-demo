resource "aws_ebs_encryption_by_default" "acloudsecninja-encryption-by-default" {
  enabled = true
}

resource "aws_ebs_default_kms_key" "acloudsecninja-default-ebs-kms-key" {
  key_arn = aws_kms_key.acloudsecninja-default-ebs-kms-key.arn
}

resource "aws_kms_key" "acloudsecninja-default-ebs-kms-key" {
  description             = "acloudsecninja-default-ebs-kms-key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}