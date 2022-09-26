variable "instance_name" {
  description = "value of the name for the ec2 instance"
  type        = string
  default     = "charli-ec2-instance"
}

variable "state_bucket_name" {
  description = "bucket to store state"
  type        = string
  default     = "charli-tf-state-bucket"
}
