#!/bin/sh

VCSUSER="git"
ROOT="/opt/bitnami/phabricator"

if [ "$1" != "$VCSUSER" ];
then
  exit 1
fi

exec "$ROOT/bin/ssh-auth" $@
