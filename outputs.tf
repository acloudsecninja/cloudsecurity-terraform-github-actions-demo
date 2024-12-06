################################################################################
# Key Pair
################################################################################

output "private_key_openssh" {
  description = "Private key data in OpenSSH PEM (RFC 4716) format"
  value       = aws_key_pair.acloudsecninja-mgmt-key
  sensitive   = true
}

output "private_key_pem" {
  description = "Private key data in PEM (RFC 1421) format"
  value       = aws_key_pair.acloudsecninja-mgmt-key
  sensitive   = true
}