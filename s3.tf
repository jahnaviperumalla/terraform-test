
resource "aws_s3_bucket" "temp" {

    bucket = "bucket-name" 

    acl = "access"   

    versioning {
    enabled = "enable"
  }


}