variable "aws_access_key_id" { }

variable "aws_secret_access_key" { }

variable "greeting_message" {
  description = "The message to display on the web server"
  type        = string
  default     = "Hello, cosmonaut!"
}