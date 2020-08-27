#!/bin/bash
# second script of lab 0
##### CONSTANTS
ARCHIVE_NAME=$1
BASE=$(basename -s .tgz "$ARCHIVE_NAME")
#### MAIN
SCRATCH=$(mktemp -d)
# extracting the contents of the tar archive, and putting them into
# the new scratch dir
tar -xzf "$ARCHIVE_NAME" -C "$SCRATCH"
# perserving the current position so I can come back later
HERE=$(pwd)
# moving to the scratch dir 
cd "$SCRATCH" || exit
# remove all the files that contain "DELETE ME"
# the -l flag displays the filenames that contain the delete me phrase 
grep -Rl "DELETE ME" . | xargs rm   
# Creating a new compressed tar archive that contains the files left over in the scratch di
tar -zcf cleaned_"$ARCHIVE_NAME" "$BASE"
mv cleaned_"$ARCHIVE_NAME" "$HERE"
cd "$HERE" || exit 
#delete the scratch dir

