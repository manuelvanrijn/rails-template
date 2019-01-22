# ./wait-for-it.sh db:5432
#!/bin/sh
set -e

usage()
{
    cat << USAGE >&2
Usage:
    wait-for-it.sh --host=host --port=port
    -h HOST | --host=HOST                       Host or IP
    -p PORT | --port=PORT                       TCP port
                                                Alternatively, you specify the host and port as host:port
    -s SLEEP_TIME | --sleep_time=SLEEP_TIME     (Default:  1) Sleep time between retries in seconds, zero for no sleep time
    -r MAX_RETRIES | --retries=MAX_RETRIES      (Default: 15) Amount of retries before exiting
USAGE
    exit 1
}

while [ $# -gt 0 ]
do
  case "$1" in
    -h)
    HOST="$2"
    if [[ $HOST == "" ]]; then break; fi
    shift 2
    ;;
    --host=*)
    HOST="${1#*=}"
    shift 1
    ;;
    -p)
    PORT="$2"
    if [[ $PORT == "" ]]; then break; fi
    shift 2
    ;;
    --port=*)
    PORT="${1#*=}"
    shift 1
    ;;
    -s)
    SLEEP_TIME="$2"
    if [[ $SLEEP_TIME == "" ]]; then break; fi
    shift 2
    ;;
    --sleep_time=*)
    SLEEP_TIME="${1#*=}"
    shift 1
    ;;
    -r)
    MAX_RETRIES="$2"
    if [[ $MAX_RETRIES == "" ]]; then break; fi
    shift 2
    ;;
    --retries=*)
    MAX_RETRIES="${1#*=}"
    shift 1
    ;;
    --help)
    usage
    ;;
    *)
    echo "Unknown argument: $1"
    usage
    ;;
  esac
done

if [[ "$HOST" == "" || "$PORT" == "" ]]; then
  echo "Error: you need to provide a host and port to test."
  usage
fi

MAX_RETRIES=${MAX_RETRIES:-15}
SLEEP_TIME=${SLEEP_TIME:-1}
RETRIES=0

while true; do
    # nc -z $HOST $PORT
    if [ $RETRIES -eq $MAX_RETRIES ]; then
      echo ""
      echo "✖️ [WFI][FAIL] Error connecting to $HOST on port $PORT after $RETRIES retries..."
      exit 1
    fi

    if nc -z $HOST $PORT; then
      echo "✔︎ [WFI][SUCCESS] connection to $HOST on port $PORT, tried: $RETRIES times with a sleep time of $SLEEP_TIME"
      exit 0
    fi
    printf "."
    RETRIES=$((RETRIES+1))
    sleep $SLEEP_TIME
done

echo ""
echo "✖️ [WFI][FAIL] Error connecting to $HOST on port $PORT"
exit 1
