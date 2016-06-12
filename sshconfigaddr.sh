#!/bin/bash

CONFIGFILE=~/.ssh/config
cat $CONFIGFILE

read -p "Enter Connection name: " connectionname
read -p "Enter Host name: " hostname
read -p "Enter User name: " username
read -p "Enter Port number: " portnumber
read -p "Enter IdentityFile path (if you do not use IdentityFile, empty): " identityfilepath

if [ -z $portnumber ]; then
    portnumber="22"
fi

if [ -z $identityfilepath ]; then
    echo 'Host '$connectionname
    echo '    HostName    '$hostname
    echo '    User        '$username
    while read -p "OK? [y/N] " yn ; do
        case $yn in
            [Yy]* ) {
                echo 'Host '$connectionname >> $CONFIGFILE
                echo '    HostName    '$hostname >> $CONFIGFILE
                echo '    User        '$username >> $CONFIGFILE
                echo '    Port        '$portnumber >> $CONFIGFILE
                exit
            };;
            [Nn]* ) {
                echo 'Terminated.'
                exit
            };;
            * ) echo 'Please yes or no';;
        esac
    done
else
    echo 'Host '$connectionname
    echo '    HostName     '$hostname
    echo '    User         '$username
    echo '    IdentityFile '$identityfilepath
    while read -p "OK? [y/N] " yn ; do
        case $yn in
            [Yy]* ) {
                echo 'Host '$connectionname >> $CONFIGFILE
                echo '    HostName    '$hostname >> $CONFIGFILE
                echo '    User        '$username >> $CONFIGFILE
                echo '    Port        '$portnumber >> $CONFIGFILE
                echo '    IdentityFile '$identityfilepath >> $CONFIGFILE
                exit
            };;
            [Nn]* ) {
                echo 'Terminated.'
                exit
            };;
            * ) echo 'Please yes or no';;
        esac
    done
fi
