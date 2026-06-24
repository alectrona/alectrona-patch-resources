#!/bin/bash

# Apps With Available Updates
#
# This attribute returns all installed apps that are updatable (out-of-date) using Alectrona Patch.
#
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
	appID=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.id raw -o - -) || continue
	installedVersion=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.version raw -o - -) || continue
	targetVersion=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.targetVersion raw -o - -) || continue
	deferralLimit=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.deferralLimit raw -o - -) || continue
	deferralCount=$(echo "$report" | /usr/bin/plutil -extract appInventory.$index.deferralCount raw -o - - 2>/dev/null) || deferralCount=0
	deferralsRemaining=$(( deferralLimit - deferralCount ))

	# Add the app to the array
	updatableApps+=("ID: $appID"$'\n'"Installed Version: $installedVersion"$'\n'"Available Version: $targetVersion"$'\n'"Deferrals Remaining: $deferralsRemaining"$'\n')
done

# Join array elements with newlines
if [[ "${#updatableApps[@]}" -eq 0 ]]; then
	echo "<result>No updatable apps</result>"
	exit 0
fi

result=$(printf "%s\n" "${updatableApps[@]}")

# Return the result
printf "<result>%b</result>\n" "$result"

exit 0