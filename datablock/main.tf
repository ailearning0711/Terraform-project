data "aws_ami" "Harley_AMI_image" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = var.value
  }
}

data "aws_subnet" "Web1" {
    id = "subnet-0a00dbb7137a6d275"
    }
 

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.Harley_AMI_image.id
  instance_type = var.machinetype
  key_name      = "Harley"
  subnet_id = data.aws_subnet.Web1.id

  tags = {
    Name = "HelloWorld"
  }
}