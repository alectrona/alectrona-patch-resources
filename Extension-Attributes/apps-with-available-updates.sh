#!/bin/bash

# Apps With Available Updates

# This attribute returns all installed apps that are updatable (out-of-date) using Alectrona Patch.

# Exit if Alectrona Patch is not installed
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
	exit 1
fi

# Generate the report
report=$(/Library/Application\ Support/Alectrona/Patch/patch report --updatable 2>/dev/null)
if [[ -z "$report" ]]; then
	echo "<result>No updatable apps</result>"
	exit 0
fi

# Get the length of the appInventory array
length=$(echo "$report" | /usr/bin/plutil -extract appInventory raw -o - -)
updatableApps=()

if [[ "$length" -eq 0 ]]; then
	echo "<result>No updatable apps</result>"
	exit 0
fi

# Loop through the appInventory array and build the result
for ((index=0; index<length; index++)); do
	appID=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.id raw -o - -)
	installedVersion=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.version raw -o - -)
	targetVersion=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.targetVersion raw -o - -)

	# Add the app to the array
	updatableApps+=("ID: $appID\nInstalled Version: $installedVersion\nAvailable Version: $targetVersion\n")
done

# Join array elements with newlines
result=$(printf "%s\n" "${updatableApps[@]}")

# Return the result
echo -e "<result>$result</result>"

exit 0