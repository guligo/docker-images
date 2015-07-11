echo 'Cloning Git repo'
git clone https://$1@github.com/guligo/tipspromenad.git
cd tipspromenad

echo 'Starting up MySQL server'
service mysql start
mysql -u root -e 'create database tipspromenad default character set = "UTF8" default collate = "utf8_general_ci";'

echo 'Building and deploying web-app to Tomcat'
mvn clean package cargo:run -Denv.serverHome=$2 -Dcaptcha.privateKey=$3 -Dfb.appId=$4 -Dfb.appSecret=$5

