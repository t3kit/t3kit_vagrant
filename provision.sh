#!/usr/bin/env bash

echo "=============================="
echo -e "Starting Provision... \r0% "
echo "=============================="

# Create MySQL DB for TYPO3
PASSWORD="t3kit1234"
DATABASE="t3kit"
USERNAME="t3kit"
RESTART_APACHE="0"
RESTART_MYSQL="0"

if [ -f /var/www/shared/db/$DATABASE.sql ]; then
    echo -e "Installing/updating DB $DATABASE... \r30% "
    mysql -uroot -p1234 -e "CREATE DATABASE IF NOT EXISTS $DATABASE CHARACTER SET utf8 COLLATE utf8_swedish_ci;"
    mysql -uroot -p1234 -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USERNAME'@localhost IDENTIFIED BY '$PASSWORD';"
    mysql -uroot -p1234 $DATABASE < /var/www/shared/db/$DATABASE.sql
    RESTART_MYSQL="1"
else
    echo -e "No database dump found, skipping import ($DATABASE.sql)... \r30% "
fi

#echo "Moving TYPO3 temp out of NFS to improve speed"

# Move typo3temp to home to increase performance and avoid problems with filetimes
if [ ! -d /home/vagrant/typo3temp ]; then
    sudo service apache2 stop
    RESTART_APACHE="1"

    mkdir /home/vagrant/typo3temp
    sudo chown vagrant:www-data /home/vagrant/typo3temp -R
    sudo chmod 770 /home/vagrant/typo3temp -R
    echo -e "Created /home/vagrant/typo3temp"
fi

#Checking if typo3temp is symlinked to /home/vagrant/typo3temp"
if [ -d /var/www/shared/site ]; then
    cd /var/www/shared/site
    if [ ! -L typo3temp ]; then
        if [ $RESTART_APACHE = "0" ]; then
            sudo service apache2 stop
            RESTART_APACHE="1"
        fi

        sudo rm typo3temp/ -rf
        sudo ln -s /home/vagrant/typo3temp typo3temp
        echo -e "Created symlink from typo3temp to /home/vagrant/typo3temp"
    fi
fi

if [ $RESTART_MYSQL = "1" ]; then
    # Restart MySQL
    echo -e "Restarting MySQL... \r70% "
    service mysql restart > /dev/null 2>&1
fi

if [ $RESTART_APACHE = "1" ]; then
    # Restart Apache
    echo -e "Restarting Apache... \r90% "
    service apache2 restart > /dev/null 2>&1
fi


echo "Provision complete!"
sleep 2
echo "=============================="
echo "========== INFO =============="
echo "=============================="
echo "VM IP"
ifconfig | perl -nle'/dr:(\S+)/ && print $1'
echo "=============================="
echo "=============================="
echo "TYPO3 login: admin"
echo "TYPO3 password: admin1234"
echo "TYPO3 install tools password: admin1234"
echo "------------------------------"
echo "DB name: $DATABASE"
echo "DB login: $USERNAME"
echo "DB password: $PASSWORD"
echo "=============================="
echo "=============================="
echo "Open site in browser using IP address or localhost:8081"
