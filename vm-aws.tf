resource "aws_key_pair" "key" {
  key_name   = "aws-key-pipeline"
  public_key = var.aws_key_public
}

resource "aws_instance" "vm" {
  ami                         = "ami-05401e1394491333f"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}