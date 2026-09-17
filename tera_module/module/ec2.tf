resource "aws_instance" "webserver" {
  ami             = var.amiid
  instance_type   = var.machinetype
  vpc_security_group_ids = [aws_security_group.global-sg-2021.id]
  key_name        = var.keyname

  tags = {
    Name = var.mytag
  }
}