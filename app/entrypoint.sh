#!/bin/sh

echo "Running entrypoint.sh"

if [ "$DATABASE" = "postgres" ]
then
    echo "Waitiing for PostgreSQL..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started!"
fi

# python manage.py flush --no-input
# python manage.py makemigrations
# python manage.py migrate

exec "$@"
