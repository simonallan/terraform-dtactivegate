data "template_file" "user_data" {
  template = file("${path.module}/${var.user_data_file}")

  vars = {
    s3_bucket_name              = aws_s3_bucket.activegate.id
    s3_bucket_uri               = var.s3_bucket_uri
    ssh_user                    = var.ssh_user
    keys_update_frequency       = var.keys_update_frequency
    enable_hourly_cron_updates  = var.enable_hourly_cron_updates
    additional_user_data_script = var.additional_user_data_script
  }
}

# locals {
#   # Common tags to be assigned to all resources
#   common_tags = {
#     product     = var.product_name
#     environment = var.environment
#     owner       = var.owner
#     contact     = var.contact
#   }
#   deployment_name = "${var.product_name}-${var.environment}"
# }