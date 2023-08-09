#!/bin/bash

# Update Jamf Connect with Alectrona Patch

# Updates Jamf Connect with Alectrona Patch by ensuring the Jamf Connect LaunchAgent is unloaded before installation.

loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
loggedInUID=$(/usr/bin/id -u "$loggedInUser" 2>/dev/null)
exitCode="0"

# Check if Jamf Connect is out of date
if ! /usr/local/bin/patch compare jamf-connect --fail ; then

    echo "Jamf Connect is out of date, beginning update."

    # Unload the Jamf Connect LaunchAgent for the user
    if [[ -n "$loggedInUser" ]]; then
        echo "Unloading the LaunchAgent for $loggedInUser..."
        /bin/launchctl bootout "gui/$loggedInUID" /Library/LaunchAgents/com.jamf.connect.plist
    fi

    # Kill Jamf Connect for good measure
    /usr/bin/killall "Jamf Connect" 2>/dev/null

    # Update Jamf Connect
    /usr/local/bin/patch install jamf-connect
    exitCode="$?"

    # Reload the Jamf Connect LaunchAgent for the user
    if [[ -n "$loggedInUser" ]]; then
        echo "Loading the LaunchAgent for $loggedInUser..."
        /bin/launchctl bootstrap "gui/$loggedInUID" /Library/LaunchAgents/com.jamf.connect.plist
    fi
fi

exit "$exitCode"