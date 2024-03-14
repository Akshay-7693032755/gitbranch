resource  "aws_instance"  "this_instance"{
    ami = "ami-0382ac14e5f06eb95"
    instance_type = "t2.micro"
    availability_zone = "ap-northeast-2d"
root_block_device {
    volume_size = 10
    volume_type = "gp2"
    delete_on_termination = true 
}
user_data = <<-EOF
#!/bin/bash
sudo -i
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt-get install openjdk-11-jre-headless -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins 
EOF
}