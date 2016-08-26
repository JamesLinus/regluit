#!/bin/bash

cd /opt/regluit
source ENV/bin/activate
export DJANGO_SETTINGS_MODULE=regluit.settings.please

sysadmin/drop_tables.sh | django-admin.py dbshell
cat test/campaign_starter.sql | django-admin.py dbshell

django-admin.py makemigrations
django-admin.py migrate --noinput

#django-admin.py migrate default 0001 --fake
#django-admin.py syncdb --migrate --noinput
