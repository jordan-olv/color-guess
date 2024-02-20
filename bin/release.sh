#!/bin/sh

echo "-----> Configurer les commandes de démarrage pour Symfony"

cat <<EOF
web: heroku-php-apache2 api/public/
EOF
