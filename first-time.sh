#!/bin/bash
# this script create firts time enviorment.
# If you want more options, yo can run script-master.sh inside web bash


docker-compose up -d &&
docker-compose exec web composer install &&
docker-compose exec web vendor/bin/run toolkit:build-dev &&
docker-compose exec web vendor/bin/run toolkit:install-clean &&
echo "########################################################################################"
echo "Now, you have DRUPAL 10 with standard profile installed, you can check in localhost:8080" &&
echo "########################################################################################" &&
echo "Next line you can get a drush uli command result:" &&
docker-compose exec web drush uli &&
echo "#######################################" &&
echo "Now you redirect to bash web container:" &&
echo "#######################################" &&
docker-compose exec web bash