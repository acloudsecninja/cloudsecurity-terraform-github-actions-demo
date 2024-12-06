resource "aws_key_pair" "acloudsecninja-mgmt-key" {
  key_name   = "acloudsecninja-mgmt-kp.pub"
  public_key = file("./ssh-keys/acloudsecninja-mgmt-kp.pub")
}