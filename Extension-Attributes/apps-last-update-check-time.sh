#!/bin/bash

# Last Update Check
#
# This attribute returns the last time Alectrona Patch ran an update check.
#
# Exit if Alectrona Patch is not installed
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
	exit 1
fi

# Generate the report
report=$(/Library/Application\ Support/Alectrona/Patch/patch report --updatable 2>/dev/null)
if [[ -z "$report" ]]; then
	echo "<result>No report available</result>"
	exit 0
fi

# Extract the last update check timestamp
lastCheck=$(echo "$report" | /usr/bin/plutil -extract patchInfo.lastUpdateTaskRun raw -o - -) || {
	echo "<result>Unknown</result>"
	exit 0
}

epoch=$(date -j -u -f "%Y-%m-%dT%H:%M:%SZ" "$lastCheck" "+%s")
localTime=$(date -r "$epoch" "+%Y-%m-%d %H:%M:%S %Z")

echo "<result>$localTime</result>"

exit 0
