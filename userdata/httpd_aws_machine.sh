#!/bin/bash
#https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html
#
sudo yum update -y 
sudo yum install -y httpd
sudo yum install -y git
sudo amazon-linux-extras install -y php7.2
sudo systemctl start httpd
sudo systemctl enable httpd
sudo chkconfig httpd on
sudo usermod -a -G apache ec2-user
sudo git clone https://github.com/zeineldin/AWS-ELB-testapp.git
cd AWS-ELB-testapp
sudo cp index.php /var/www/html/

# x-forwarded
# LogFormat "%h \"%{X-Forwarded-For}i\" %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
