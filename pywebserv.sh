#!/bin/bash

export PORT=8080

# currently unused
function printhelp() {
	echo "Usage: $0 [port]"
}

if [ $# -eq 0 ]; then
	echo "[*] Using default port: $PORT"
else
	PORT=$1
	echo "[*] Using provided port: $1"
fi

echo "[*] Running Python web server..."
python -m http.server $PORT
echo "Done."
