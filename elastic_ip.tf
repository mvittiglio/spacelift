### elastic_ip.tf ###
resource "aws_elastic_ip" "web" {
  instance = aws_instance.web.id
}