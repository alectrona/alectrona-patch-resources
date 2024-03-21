#!/bin/bash

# Install or Update with Alectrona Patch

# A script to Install or Update a software title with Alectrona Patch in a Jamf Pro policy.

softwareID="$4"         # The Software ID of the application
options="$5"            # The various command line arguments (--force|--update-only|--recon etc.)
ignorePatchErrors="$6"  # Ignore Patch Errors (true|false)
unset patchCTL

# If Alectrona Patch is not installed, install it using a Jamf policy trigger of "alectrona-patch"
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    echo "Alectrona Patch is not installed, installing..."
    /usr/local/bin/jamf policy -event alectrona-patch
    if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
        echo "Error: Unable to install Alectrona Patch, exiting."
        exit 1
    fi
fi

# Determine the patch command line tool full path
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    echo "Error: Failed to find patch command line tool; exiting."
    exit 2
fi

# Run the patch binary with the software ID and options
# Not quoting the options as we want to word-split
/Library/Application\ Support/Alectrona/Patch/patch install "$softwareID" $options
result="$?"

if [[ "$ignorePatchErrors" == "true" ]]; then
    exit 0
else
    exit "$result"
fi