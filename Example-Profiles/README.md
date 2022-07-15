# Alectrona Patch Example Profiles
Here are some example profiles for Alectrona Patch that you can use to set custom branding settings and enable Deferral Limits.

## Patch Agent Configuration
[This example profile](./Patch-Agent-Configuration.mobileconfig) configures the Patch Agent to do the following:
* Install **or** update Slack and Zoom
* Update Signal, Spotify, and Visual Studio Code
* Set the Run Interval (how often the Patch Agent runs) to 3600 seconds (1 hour)

[This example profile](./Patch-Agent-Silent-Updates-Only.mobileconfig) configures the Patch Agent to only update applications when they are closed. This effectively suppresses the update dialogs that users would see as only applications that are not running would be updated.

## Custom Branding Settings
[This example profile](./Custom-Branding-Settings.mobileconfig) configures some of the custom branding settings in the Patch Notifier such as:

* Custom dialog description
* Custom defer and update button labels
* A dialog timeout of 60 seconds (600 seconds is default)
* Enables the Help button in the lower left with a custom on-hover tooltip that displays a view with custom text

## Deferral Limits
[This example profile](./Deferral-Limits.mobileconfig) enables Deferral Limits and a custom final dialog timeout (60 seconds is default).

* Enables a global Deferral Limit of 5
* Enables an exception to the global Deferral Limit that allows indefinite deferrals for Firefox, and 10 deferrals for Zoom
* Sets a timeout for the final update dialog of 30 seconds before an application is automatically closed and updated

Please visit the [Patch Docs - Patch Notifier](https://patchdocs.alectrona.com/docs/patch-notifier/) for additional information.