#!/bin/bash
set -e

cd /opt/phabricator/phabricator
./bin/config set mysql.host 173.194.105.239
./bin/config set mysql.port 3306
./bin/config set mysql.user phabricator
./bin/config set mysql.pass phabricator
./bin/storage upgrade

httpd -DFOREGROUND
