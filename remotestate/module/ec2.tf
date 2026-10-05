resource "aws_instance" "webserver" {
  ami             = var.amiid
  instance_type   = var.machinetype
  vpc_security_group_ids = [aws_security_group.harley.id]
  subnet_id = "subnet-0cebc12617a1d4a97"
  key_name        = var.keyname

  tags = {
    Name = var.mytag
  }
}
