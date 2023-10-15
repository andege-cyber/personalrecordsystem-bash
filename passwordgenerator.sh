#!bin/bash
read -p "Enter desired password length: " password_length
password=$(openssl rand -base64 48 | cut -c1-$password_length)

echo "Generated password: $password"

