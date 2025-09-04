#!/bin/bash

echo "Secure Receiver - Waiting for messages. Press Ctrl+C to exit."

while true; do
  encrypted=$(nc -l -p 12345)
  if [ ! -z "$encrypted" ]; then
    decrypted=$(echo "$encrypted" | openssl enc -aes-256-cbc -d -salt -base64 -pbkdf2 -iter 10000 -pass pass:secretpassword 2> /dev/null)
    echo "Received message: $decrypted"
  fi
done
