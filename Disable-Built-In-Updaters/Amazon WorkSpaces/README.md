# Disable Built-In Updater — Amazon WorkSpaces

> Disables the built-in update mechanism for the [Amazon WorkSpaces](https://clients.amazonworkspaces.com/) client on macOS.

| | |
|---|---|
| **Vendor** | Amazon Web Services |
| **Bundle ID** | com.amazon.workspaces |
| **Minimum App Version Tested** | 5.17 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `SUEnableAutomaticChecks` | Enforced | Boolean | `false` | Disables the Sparkle updater's automatic check-for-updates on launch |
| `SUScheduledCheckInterval` | Enforced | Integer | `0` | Sets the Sparkle scheduled update-check interval to zero (never) |

### Deployment

Deploy `com.amazon.workspaces.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Amazon WorkSpaces — macOS client](https://docs.aws.amazon.com/workspaces/latest/userguide/amazon-workspaces-osx-client.html)
- [Sparkle — Customizing update checks](https://sparkle-project.org/documentation/customization/)
- [MacAdmins Slack #amazon channel](https://macadmins.org)
