#!/bin/sh

BUILD_DIR=$1
CACHE_DIR=$2

echo "-----> Déploiement de l'API Symfony"

# Déplacement dans le dossier de l'API
cd "$BUILD_DIR/api"

# Installation des dépendances avec Composer
echo "-----> Installation des dépendances avec Composer"
composer install --no-dev --prefer-dist --optimize-autoloader

# Retour au dossier racine
cd -

echo "-----> API Symfony déployée"
