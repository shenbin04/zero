#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator &

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/run.sh" ]]; then
  nami_initialize apache php phabricator
  info "Starting phabricator... "
fi

exec tini -- "$@"
