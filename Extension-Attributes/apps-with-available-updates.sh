#!/bin/bash

# Apps With Available Updates

# This attribute returns all installed apps that are updatable (out-of-date) using Alectrona Patch.

# Exit if Alectrona Patch is not installed
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
    exit 1
fi

# Generate the report and return the result
report=$(/Library/Application\ Support/Alectrona/Patch/patch report --updatable 2>/dev/null)
if [[ -n "$report" ]]; then
    echo "<result>$report</result>"
fi

exit 0