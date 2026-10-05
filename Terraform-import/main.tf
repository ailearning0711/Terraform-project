resource "aws_instance" "test" {
  ami           = "ami-0d53cc9bd365ad65b"
  instance_type = "t3.micro"
  key_name      = "Harley"

  security_groups = [
    "Harley",
  ]
  tags = {
    "Name" = "prod-server"
  }

}