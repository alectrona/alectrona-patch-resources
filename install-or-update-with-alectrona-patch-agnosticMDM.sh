#!/bin/bash

# Install or Update with Alectrona Patch

# A script to Install or Update a software title with Alectrona Patch with an MDM that doesn't have a local binary, like Mosyle Business or Meraki Systems Manager.

softwareID=""        # The Software ID of the application
options=""              # The various command line arguments (--force|--update-only|--silent etc.)
ignorePatchErrors="false" # Ignore Patch Errors (true|false)

# If Alectrona Patch is not installed, install it using a Jamf policy trigger of "alectrona-patch"
function clean_up() {
    echo "Cleaning up installation files..."
    /bin/rm -Rf "$workDir"
}

if [[ ! -e /usr/local/bin/patch ]]; then
    uuid=$(/usr/bin/uuidgen)
    workDir="/private/tmp/$uuid"
    unset version

    # Clean up our temporary files upon exiting at any time
    trap clean_up EXIT

    # Make our working directory with our unique UUID generated in the variables section
    /bin/mkdir -p "$workDir"

    # Exit if there was an error with the curl
    echo "Downloading the installation files..."
    if ! /usr/bin/curl -s -L -f https://software.alectrona.com/patch/releases/alectrona-patch-latest.pkg -o "$workDir/alectrona-patch.pkg"; then
        echo "Error while downloading the installation files; exiting."
        exit 1
    fi

    # Exit if the PKG errored during install
    if ! /usr/sbin/installer -pkg "$workDir/alectrona-patch.pkg" -target /; then
        echo "Failed to install the pkg; exiting."
        exit 2
    fi

    # Exit if we can't determine the version of patch
    version=$(/usr/local/bin/patch --version 2>/dev/null)
    if [[ -n "$version" ]]; then
        echo "Successfully installed Alectrona Patch version $version."
    else
        echo "Failed to successfully install Alectrona Patch; exiting."
        exit 3
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