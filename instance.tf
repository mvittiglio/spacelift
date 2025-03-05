### instance.tf ###
resource "aws_instance" "web" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              curl -sL https://rpm.nodesource.com/setup_16.x | bash -
              yum install -y nodejs
              echo 'const http = require("http");
              const server = http.createServer((req, res) => {
                res.writeHead(200, {"Content-Type": "text/plain"});
                res.end("hello, world!\n");
              });
              server.listen(8800);' > server.js
              nohup node server.js &
              EOF
  tags = {
    Name = "web-server"
  }
}
