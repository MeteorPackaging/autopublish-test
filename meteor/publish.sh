#!/bin/bash

UNAME_PWD = "$METEOR_USER
$METEOR_PWD"

echo "Logging in to meteor.com"
echo "$UNAME_PWD" | meteor login

echo "Logged in as:"
meteor whoami

echo "Now publishing"
meteor publish

echo "Done!"
