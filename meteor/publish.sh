#!/bin/bash

UNAME_PWD="$METEOR_USER
$METEOR_PWD"

echo "Logging in to meteor.com"
echo "$UNAME_PWD" | meteor login

echo "Logged in as:"
meteor whoami

echo "Now Publishing..."
# attempt to re-publish the package - the most common operation once the initial release has been made
POTENTIAL_ERROR=$( meteor publish 2>&1 )

if [[ $POTENTIAL_ERROR =~ "There is no package named" ]]; then
    # actually this is the first time the package is created, so pass the special --create flag and congratulate the maintainer
    if meteor publish --create; then
        echo "Thank you for creating the $PACKAGE_NAME Meteor package!"
    else
        echo "We got an error. Please post it at https://github.com/raix/Meteor-community-discussions/issues/14"
    fi
fi
echo "Done!"
