
variable "db_vpc_id" {
  type        = string
  description = "VPC id"
  default     = ""
}

variable "password" {
  description = "Master DB password"
  type        = string
  default     = ""
}
