echo 'Cloning Git repo'
git clone https://github.com/guligo/searchpoint.git
cd searchpoint

echo 'Starting up MySQL server'
service mysql start
mysql -u root -e 'create database searchpoint default character set = "UTF8" default collate = "utf8_general_ci";'

echo 'Building and deploying web-app to Tomcat'
mvn clean package cargo:run -Denv.serverHome=/etc/tomcat-8.0.24

