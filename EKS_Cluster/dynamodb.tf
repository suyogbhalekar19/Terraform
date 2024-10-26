resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = var.billing_mode
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
