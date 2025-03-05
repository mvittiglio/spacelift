### outputs.tf ###
output "public_ip" {
  value = aws_eip.web.public_ip
  description = "Public IP of the Node.js server"
}