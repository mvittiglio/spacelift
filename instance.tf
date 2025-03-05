### instance.tf ###
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.allow_http.name]
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
              server.listen(8080);' > server.js
              nohup node server.js &
              EOF
  tags = {
    Name = "web-server"
  }
}
