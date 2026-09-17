resource "aws_instance" "harleyec2" {
  ami             = var.ami_name
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_sub1.id
  key_name        = "Harley"
  tags = {
    Name = var.tag_name
    Env  = "dev"
  }
}
#adding ebs volume
/*
resource "aws_ebs_volume" "data_disk" {
  availability_zone = aws_instance.harleyec2.availability_zone
  size              = var.ebs_size
  type              = var.ebs_type

  tags = {
    Name = var.volume
  }
}
#Attach Ebs volume into instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.data_disk.id
  instance_id = aws_instance.harleyec2.id
}*/