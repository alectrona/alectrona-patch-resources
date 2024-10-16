#!/bin/bash

# Apps Installed and in the Patch Catalog

# This attribute returns all installed apps that exist in the Patch Catalog

# Exit if Alectrona Patch is not installed
if [[ ! -e /Library/Application\ Support/Alectrona/Patch/patch ]]; then
	exit 1
fi

# Generate the report
report=$(/Library/Application\ Support/Alectrona/Patch/patch report 2>/dev/null)
if [[ -z "$report" ]]; then
	echo "<result>No installed apps</result>"
	exit 0
fi

# Get the length of the appInventory array
length=$(echo "$report" | /usr/bin/plutil -extract appInventory raw -o - -)
installedApps=()

if [[ "$length" -eq 0 ]]; then
	echo "<result>No installed apps</result>"
	exit 0
fi

# Loop through the appInventory array and build the result
for ((index=0; index<length; index++)); do
	appID=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.id raw -o - -)
	installedVersion=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.version raw -o - -)

	# Add the app to the array
	installedApps+=("ID: $appID\nInstalled Version: $installedVersion\n")
done

# Join array elements with newlines
result=$(printf "%s\n" "${installedApps[@]}")

# Return the result
echo -e "<result>$result</result>"

exit 0