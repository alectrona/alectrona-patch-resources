#!/bin/bash

# Install Duo Device Health App with Alectrona Patch

# Installs the Duo Device Health app per Duo's instructions
# https://duo.com/docs/device-health

# Jamf Pro Parameters
forceUpdate="$4"        # (true|false)
ignorePatchErrors="$5"  # (true|false)

# Variables
loggedInUser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/ && ! /loginwindow/ { print $3 }' )
loggedInUID=$(/usr/bin/id -u "$loggedInUser" 2>/dev/null)

# Install Alectrona Patch if not installed
if [[ ! -e /usr/local/bin/patch ]]; then
    echo "Alectrona Patch is not installed, installing..."
    /usr/local/bin/jamf policy -event alectrona-patch
    if [[ ! -e /usr/local/bin/patch ]]; then
        echo "Unable to install Alectrona Patch, exiting."
        exit 1
    fi
fi

# Create the directory
/bin/mkdir -p "/Library/Application Support/Duo/Duo Device Health"

# Create the file that instructs the Duo Device Health app to disable certificate management (for certificate management via MDM)
/usr/bin/touch "/Library/Application Support/Duo/Duo Device Health/DisableMacOS11CertManagement"

# Create a file that will suppress the launch of the Duo Device Health app because it attempts to do this as the user who initiates the install
touch /tmp/duo-no-launch

# Install the Duo Device health app with Alectrona Patch
if [[ "$forceUpdate" == "true" ]]; then
    /usr/local/bin/patch install -s duo-device-health --unattended --force
    result="$?"
else
    /usr/local/bin/patch install -s duo-device-health --unattended
    result="$?"
fi

# Remove the file we created earlier
rm /tmp/duo-no-launch

# Disable updates and launch the app if someone is logged in
if [[ -n "$loggedInUser" ]]; then
    # Disable updates
    /usr/bin/defaults write "/Users/$loggedInUser/Library/Preferences/com.duosecurity.duo-device-health.plist" SUEnableAutomaticChecks -bool NO
    /usr/bin/defaults write "/Users/$loggedInUser/Library/Preferences/com.duosecurity.duo-device-health.plist" SUAllowsAutomaticUpdates -bool NO
    /usr/bin/defaults write "/Users/$loggedInUser/Library/Preferences/com.duosecurity.duo-device-health.plist" SUAutomaticallyUpdate -bool NO

    # Set perms for the file we just modified as root
    /usr/sbin/chown -R "$loggedInUser:" "/Users/$loggedInUser/Library/Preferences/com.duosecurity.duo-device-health.plist"

    # Launch the app as the user if we installed it successfully
    if [[ "$result" == "0" ]]; then
        /bin/launchctl asuser "$loggedInUID" /usr/bin/open -a "/Applications/Duo Device Health.app" 2>/dev/null
    fi
fi

# If we specified to ignore Patch errors then just exit normally
if [[ "$ignorePatchErrors" == "true" ]]; then
    exit 0
else
    exit "$result"
fi