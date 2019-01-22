#!/bin/sh
set -e

bundle check || bundle install
sh ./wait-for-it.sh --host=db --port=3306 --sleep_time=10

exec "$@"
