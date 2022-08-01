#!/bin/bash

# Uninstall Alectrona Patch

# A script to uninstall Alectrona Patch

loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
loggedInUID=$(/usr/bin/id -u "$loggedInUser" 2>/dev/null)
daemonIdentifier="com.alectrona.patch-agent"
daemonPlist="/Library/LaunchDaemons/${daemonIdentifier}.plist"
notifierHelperIdentifier="com.alectrona.patch-notifier-helper"
notifierHelperPlist="/Library/LaunchAgents/${notifierHelperIdentifier}.plist"

# Exit if not being run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Error: This application must be run as root. Try the sudo command."
    exit 1
fi

# Stop the LaunchDaemon if it is running
if /bin/launchctl print system | /usr/bin/grep -q "$daemonIdentifier" ; then
    /bin/launchctl bootout system "$daemonPlist"
fi

# Unload the LaunchAgent for the currently logged in user
if [[ -n "$loggedInUser" ]]; then
    if /bin/launchctl print "gui/$loggedInUID" | /usr/bin/grep -q "$notifierHelperIdentifier" ; then
        /bin/launchctl bootout "gui/$loggedInUID" "$notifierHelperPlist"
    fi
fi

# Remove the associated files
/bin/rm "$daemonPlist" 2> /dev/null
/bin/rm "$notifierHelperPlist" 2> /dev/null
/bin/rm -f "/usr/local/bin/patch" 2> /dev/null
/bin/rm -Rf "/Library/Application Support/Alectrona/Patch" 2> /dev/null
/bin/rm /Users/*/Library/Preferences/com.alectrona.patch-notifier.plist 2> /dev/null

# Forget pkg receipts
/usr/sbin/pkgutil --forget com.alectrona.patch-notifier 2> /dev/null
/usr/sbin/pkgutil --forget com.alectrona.patch 2> /dev/null
/usr/sbin/pkgutil --forget com.alectrona.patch-agent 2> /dev/null

exit 0
