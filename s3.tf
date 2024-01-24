resource "aws_s3_bucket" "state_store" {
  bucket        = "hvpc.shop"
  force_destroy = true
}