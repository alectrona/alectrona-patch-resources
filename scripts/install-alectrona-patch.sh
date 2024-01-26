#!/bin/bash

# Install Alectrona Patch

# Installs the latest release of Alectrona Patch

# Created by Alectrona at https://github.com/alectrona/alectrona-patch-resources

proxyURL="$4"   # If required by your network, set a proxy url for the download
uuid=$(/usr/bin/uuidgen)
workDir="/private/tmp/$uuid"
curlCommand=("/usr/bin/curl" "-sfL")
unset version

function clean_up () {
    echo "Cleaning up installation files..."
    /bin/rm -Rf "$workDir"
}

# Clean up our temporary files upon exiting at any time
trap clean_up EXIT

# Make our working directory with our unique UUID generated in the variables section
/bin/mkdir -p "$workDir"

# Add proxy url if set
if [[ -n "$proxyURL" ]]; then
    echo "Setting proxy URL to: $proxyURL"
    curlCommand+=("--proxy" "$proxyURL")
fi

# Exit if there was an error with the curl
echo "Downloading the installation files..."
if ! "${curlCommand[@]}" https://software.alectrona.com/patch/releases/alectrona-patch-latest.pkg -o "$workDir/alectrona-patch.pkg" ; then
    echo "Error while downloading the installation files; exiting."
    exit 1
fi

# Check the pkg code signature
if ! /usr/sbin/pkgutil --check-signature "$workDir/alectrona-patch.pkg" | /usr/bin/grep -q "Developer ID Installer: Alectrona LLC (FHGVDQ8V3Q)"; then
    echo "Failed to validate the package code signature; exiting."
    exit 2
fi

# Exit if the PKG errored during install
if ! /usr/sbin/installer -pkg "$workDir/alectrona-patch.pkg" -target / ; then
    echo "Failed to install the pkg; exiting."
    exit 3
fi

# Determine the version of patch
version=$(/Library/Application\ Support/Alectrona/Patch/patch --version 2> /dev/null)

# Exit if we can't determine the version of patch
if [[ -n "$version" ]]; then
    echo "Successfully installed Alectrona Patch version $version."
else
    echo "Failed to successfully install Alectrona Patch; exiting."
    exit 4
fi

exit 0