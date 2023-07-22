#!/bin/sh

echo "Apply database migrations"
python manage.py -y makemigrations
python manage.py migrate

exec "$@"