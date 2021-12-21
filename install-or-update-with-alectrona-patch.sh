#!/bin/bash

# Install or Update with Alectrona Patch

# A script to Install or Update a software title with Alectrona Patch in a Jamf Pro policy.

softwareID="$4"         # The Software ID of the application
options="$5"            # The various command line arguments (--force|--update-only|--recon etc.)
ignorePatchErrors="$6"  # Ignore Patch Errors (true|false)

# If Alectrona Patch is not installed, install it using a Jamf policy trigger of "alectrona-patch"
if [[ ! -e /usr/local/bin/patch ]]; then
    echo "Alectrona Patch is not installed, installing..."
    /usr/local/bin/jamf policy -event alectrona-patch
    if [[ ! -e /usr/local/bin/patch ]]; then
        echo "Unable to install Alectrona Patch, exiting."
        exit 1
    fi
fi

# Run the patch binary with the software ID and options
# Not quoting the options as we want to word-split
/usr/local/bin/patch install -s "$softwareID" $options
result="$?"

if [[ "$ignorePatchErrors" == "true" ]]; then
    exit 0
else
    exit "$result"
fi