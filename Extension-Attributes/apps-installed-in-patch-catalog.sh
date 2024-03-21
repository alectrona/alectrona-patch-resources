#!/bin/bash

# Apps Installed and in the Patch Catalog

# This attribute returns all installed apps that exist in the Patch Catalog

# Exit if Alectrona Patch is not installed
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    exit 1
fi

# Generate the report and return the result
report=$(/Library/Application\ Support/Alectrona/Patch/patch report --installed 2>/dev/null)
if [[ -n "$report" ]]; then
    echo "<result>$report</result>"
fi

exit 0