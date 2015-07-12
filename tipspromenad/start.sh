echo 'Cloning Git repo'
git clone https://github.com/guligo/tipspromenad.git
cd tipspromenad

echo 'Starting up MySQL server'
service mysql start
mysql -u root -e 'create database tipspromenad default character set = "UTF8" default collate = "utf8_general_ci";'

echo 'Building and deploying web-app to Tomcat'
mvn clean package cargo:run -Denv.serverHome=/etc/tomcat-8.0.24 -Dcaptcha.privateKey=$1 -Dfb.appId=$2 -Dfb.appSecret=$3

