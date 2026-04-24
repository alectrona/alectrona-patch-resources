# Disable Built-In Updater — Visual Studio Code

> Disables the built-in update mechanism and telemetry for [Visual Studio Code](https://code.visualstudio.com) on macOS.

| | |
|---|---|
| **Vendor** | Microsoft |
| **Bundle ID** | com.microsoft.VSCode |
| **Minimum App Version Tested** | 1.88 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `UpdateMode` | Enforced | String | `none` | Disables automatic update checks and installs for the VS Code desktop app |
| `TelemetryLevel` | Enforced | String | `off` | Disables all telemetry and crash reporting sent to Microsoft |
| `EnableFeedback` | Enforced | Boolean | `false` | Hides the in-app feedback/survey UI so users can't submit ad-hoc telemetry |

### Deployment

Deploy `com.microsoft.VSCode.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [VS Code — Centrally manage VS Code settings with policies - macOS](https://code.visualstudio.com/docs/enterprise/policies#_macos-configuration-profilese)
- [VS Code — Managing Auto Updates](https://code.visualstudio.com/docs/supporting/faq#_how-do-i-opt-out-of-vs-code-autoupdates)
- [MacAdmins Slack](https://macadmins.org)
