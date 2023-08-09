#!/bin/bash

# Install or Update with Alectrona Patch

# A script to Install or Update a software title with Alectrona Patch in a Jamf Pro policy.

# Note: Since v1.3.0 the patch command line tool has been moved to:
# /Library/Application\ Support/Alectrona/Patch/patch
# A symlink to patch will typically exist at /usr/local/bin/patch but could be removed if
# organizations use the RemovePatchSymlink key. So this script works for all versions.

softwareID="$4"         # The Software ID of the application
options="$5"            # The various command line arguments (--force|--update-only|--recon etc.)
ignorePatchErrors="$6"  # Ignore Patch Errors (true|false)
unset patchCTL

# If Alectrona Patch is not installed, install it using a Jamf policy trigger of "alectrona-patch"
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]] && [[ ! -e /usr/local/bin/patch ]]; then
    echo "Alectrona Patch is not installed, installing..."
    /usr/local/bin/jamf policy -event alectrona-patch
    if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]] && [[ ! -e /usr/local/bin/patch ]]; then
        echo "Error: Unable to install Alectrona Patch, exiting."
        exit 1
    fi
fi

# Determine the patch command line tool full path
if [[ -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    patchCTL=/Library/Application\ Support/Alectrona/Patch/patch
elif [[ -e /usr/local/bin/patch ]]; then
    patchCTL=/usr/local/bin/patch
else
    echo "Error: Failed to find patch command line tool; exiting."
    exit 2
fi

# Run the patch binary with the software ID and options
# Not quoting the options as we want to word-split
"$patchCTL" install "$softwareID" $options
result="$?"

if [[ "$ignorePatchErrors" == "true" ]]; then
    exit 0
else
    exit "$result"
fi