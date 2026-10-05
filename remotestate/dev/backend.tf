#Disable the backend when create the infrastructure. Once created then enable the backend service. 
terraform {
  backend "s3" {
    bucket         = "harley-s3-0711"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    # dynamodb_table = "tata-table"
    use_lockfile = true

  }
}
