#!/bin/sh
#
# Install local Python packages from a specified directory.
# Skip if the directory does not contain any folders.

set -eux

sub_dir_count=$(find $1 -maxdepth 1 -type d | wc -l)

if [ "$sub_dir_count" -gt 1 ]
then
    echo "Installing local Python packages"
    pip install --no-cache-dir $2
fi
