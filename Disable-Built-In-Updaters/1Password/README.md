# Disable Built-In Updater — 1Password

> Disables the built-in update mechanism for [1Password](https://1password.com/downloads/mac) on macOS.

| | |
|---|---|
| **Vendor** | AgileBits / 1Password |
| **Bundle ID** | com.1password.1password |
| **Minimum App Version Tested** | 8.12.12 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `updates.autoUpdate` | Enforced | Boolean | `false` | Disables automatic updates of the 1Password desktop app |

### Deployment

Deploy `com.1password.1password.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [1Password — Manage 1Password with MDM](https://support.1password.com/mobile-device-management/?mac)
- [1Password — Get 1Password for Mac](https://1password.com/downloads/mac)
- [MacAdmins Slack #1password channel](https://macadmins.org)
