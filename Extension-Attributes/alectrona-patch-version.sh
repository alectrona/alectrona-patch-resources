#!/bin/bash

# Alectrona Patch Version

# This attribute returns the version of the Patch command line tool installed.

version=$(/usr/local/bin/patch --version 2>/dev/null | /usr/bin/head -1 | /usr/bin/awk '{print $NF}')

if [[ -n "$version" ]]; then
    echo "<result>$version</result>"
else
    echo "<result>Not installed</result>"
fi

exit 0