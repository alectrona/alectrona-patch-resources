# Disable Built-In Updaters

A repository of example configuration profiles to disable the built-in update mechanisms of various macOS applications. Intended for use in managed Mac environments where app updates are controlled by an internal workflow or patching tool (e.g., via [Alectrona Patch](https://www.alectrona.com/patch/)).

## Why Disable Built-In Updaters?

In managed environments, allowing applications to self-update can cause:

- **Helper Tool prompts** - Some apps rely on helper tools for updates, leading to unexpected pop-ups that are unnecessary for a user to respond to when the app's update is managed in a separate workflow 
- **Conflict with patch management tools** - self-updaters competing with your MDM or patching workflow
- **Compliance issues** - apps updating outside of a controlled change window

Disabling built-in updaters ensures your patch management tooling or internal workflow stays in control.

## Apps Covered

| Application |
|-------------|
| [1Password](./1Password/) |
| [Amazon WorkSpaces](./Amazon%20WorkSpaces/) |
| [Claude Desktop](./Claude%20Desktop/) |
| [Firefox](./Firefox/) |
| [Ghostty](./Ghostty/) |
| [RingCentral](./RingCentral/) |
| [Slack](./Slack/) |
| [Visual Studio Code](./Visual%20Studio%20Code/) |
| [Zoom](./Zoom/) |

## Usage

### Configuration Profiles

Configuration profiles (`.mobileconfig`) can be deployed via your MDM of choice (Jamf Pro, Mosyle, Kandji/Iru, Microsoft Intune, Addigy, etc.):

1. Download the `.mobileconfig` file for the desired application.
2. Review the payload keys and adjust scope as needed.
3. Upload and deploy via your MDM.

## Contributing

Have a profile or script for an app not yet covered? Contributions are welcome!

1. Fork the repository
2. Create a new branch: `git checkout -b add/app-name`
3. Add a new subdirectory following the structure above
4. Include a `README.md` in your subdirectory with:
   - The application name and vendor
   - The preference key(s) or mechanism being disabled
   - How to verify the setting is applied
   - Any known caveats or version-specific behavior
5. Open a pull request

## Resources

- [Alectrona Patch Docs](https://patchdocs.alectrona.com/)
- [iMazing Profile Editor](https://imazing.com/profile-editor)
- [Jamf Learning Hub - Disabling Developer Auto-Updates for App Installers with Configuration Profiles
](https://learn.jamf.com/r/en-US/technical-articles/Disabling_Developer_Auto_Updatesfor_App_Installers_with_Configuration_Profiles)
- [Kandji Support - Suppressing Helper Tool Installation Prompts](https://support.kandji.io/kb/suppressing-helper-tool-installation-prompts)
- [MacAdmins Slack](https://macadmins.org)

