#!/bin/sh

set -e

echo "Saving key to file..."
echo "${INPUT_KEY}" > key.txt

echo "Set key file access rights..."
chmod 600 key.txt

[ -n "$INPUT_BEFORE" ] && ssh -v -p $INPUT_PORT -o StrictHostKeyChecking=no -i key.txt "$INPUT_USERNAME"@"$INPUT_HOST" "$INPUT_BEFORE"

echo "Starting SCP process..."
scp -pqrv -P $INPUT_PORT -o StrictHostKeyChecking=no -i key.txt $INPUT_SOURCE "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_TARGET"
echo "SCP operation completeted."

[ -n "$INPUT_AFTER" ] && ssh -v -p $INPUT_PORT -o StrictHostKeyChecking=no -i key.txt "$INPUT_USERNAME"@"$INPUT_HOST" "$INPUT_AFTER"