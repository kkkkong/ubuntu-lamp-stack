#!/bin/bash
echo "mysql bundle"
[[ -z $1 ]] && { echo "!!! Root password not set. Check the Vagrant file."; exit 1; }

export DEBIAN_FRONTEND=noninteractive

MYSQL_ROOT_PASSWORD=$1 # SET THIS! Avoid quotes/apostrophes in the password, but do use lowercase + uppercase + numbers + special chars

# Install MySQL
# Suggestion from @dcarrith (http://serverfault.com/a/830352/344471):
# echo debconf mysql-server/root_password password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
# echo debconf mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD | sudo debconf-set-selections
# sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
# sudo debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
# sudo apt-get -qq install mysql-server > /dev/null 2>&1 # Install MySQL quietly

# Install Expect
sudo apt-get -qq install expect > /dev/null 2>&1

# Build Expect script
tee ~/secure_our_mysql.sh > /dev/null << EOF
spawn $(which mysql_secure_installation)

expect "Enter current password for root (enter for none):"
send "$MYSQL_ROOT_PASSWORD\r"

expect "Change the root password? (Press y|Y for Yes, any other key for No) :"
send "n\r"

expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
send "y\r"

EOF

# Run Expect script.
# This runs the "mysql_secure_installation" script which removes insecure defaults.
sudo expect ~/secure_our_mysql.sh

# Cleanup
rm -v ~/secure_our_mysql.sh # Remove the generated Expect script
#sudo apt-get -qq purge expect > /dev/null # Uninstall Expect, commented out in case you need Expect

echo "MySQL setup completed. Insecure defaults are gone. Please remove this script manually when you are done with it (or at least remove the MySQL root password that you put inside it."
