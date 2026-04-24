# Disable Built-In Updater — Slack

> Disables the built-in update mechanism for [Slack](https://slack.com) on macOS.

| | |
|---|---|
| **Vendor** | Slack Technologies |
| **Bundle ID** | com.tinyspeck.slackmacgap |
| **Minimum App Version Tested** | 4.49.81 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `AutoUpdate` | Enforced | Boolean | `false` | Disables automatic updates of the desktop app |

### Deployment

Deploy `com.tinyspeck.slackmacgap.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Slack IT Admin documentation — Manage desktop app configurations](https://slack.com/help/articles/11906214948755-Manage-desktop-app-configurations)
- [MacAdmins Slack #slack-app channel](https://macadmins.org)
