#!/bin/bash

# Alectrona Patch Version

# This attribute returns the version of the Patch command line tool installed.

unset version

# Check the version of Alectrona Patch 1.3.0+ or fall back to the 1.2.0 and earlier version check
if [[ -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    version=$(/Library/Application\ Support/Alectrona/Patch/patch --version 2>/dev/null | /usr/bin/head -1 | /usr/bin/awk '{print $NF}')
else
    version=$(/usr/local/bin/patch --version 2>/dev/null | /usr/bin/head -1 | /usr/bin/awk '{print $NF}')
fi

if [[ -n "$version" ]]; then
    echo "<result>$version</result>"
else
    echo "<result>Not installed</result>"
fi

exit 0