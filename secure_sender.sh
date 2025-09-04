#!/bin/bash

echo "Secure Sender - Enter messages to send. Press Ctrl+C to exit."

while true; do
  echo "Enter message:"
  read message
  encrypted=$(echo "$message" | openssl enc -aes-256-cbc -salt -base64 -pbkdf2 -iter 10000 -pass pass:secretpassword 2> /dev/null)
  echo "$encrypted" | nc -N localhost 12345
done
