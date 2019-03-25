#!/bin/sh

set -e

echo $@

case "$1" in
  '')
    exec /usr/bin/supervisord -c /etc/supervisord.conf -n
    ;;

  *)
    exec "$@"
    ;;
esac
