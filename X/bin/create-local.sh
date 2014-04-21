#!/bin/bash

HTDOCS="/var/www/"
DIRNAME="$1.local"
HOSTNAME="mine"
SITES_AVAILABLE="/etc/apache2/sites-available/"
SITES_ENABLED="/etc/apache2/sites-enabled/"
USER="arnold"

# Create the directory that would store the site
mkdir "$HTDOCS$DIRNAME"
chown $USER:$USER "$HTDOCS$DIRNAME"

# Copy template file with host substituted
sed "s/$HOSTNAME/$1/g" "$SITES_AVAILABLE$HOSTNAME" > "$SITES_AVAILABLE$1"

# Create symlink on sites-enabled
ln -s "$SITES_AVAILABLE$1" "$SITES_ENABLED$1"

# Insert host
sed -i "2 a\127.0.0.1\t$DIRNAME" /etc/hosts

# Restart webserver
/etc/init.d/apache2 restart
