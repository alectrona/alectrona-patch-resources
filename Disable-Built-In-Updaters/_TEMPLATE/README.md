# Disable Built-In Updater — App Name

> Disables the built-in update mechanism for [App Name](https://vendor-website.com) on macOS.

| | |
|---|---|
| **Vendor** | Vendor Name |
| **Bundle ID** | com.vendor.appname |
| **Minimum App Version Tested** | x.x |

---

## Configuration Profile

### Preference Keys

| Key | Type | Value | Description |
|-----|------|-------|-------------|
| `SUEnableAutomaticChecks` | Boolean | `false` | Disables automatic update checks |
| `AnotherKeyHere` | String | `"value"` | Description of what this key does |

### Deployment

Deploy `com.vendor.appname.updater.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Vendor documentation or update policy page](https://example.com)
- [Relevant MacAdmins Slack thread or JAMF Nation post](https://example.com)
- [Any other useful resource](https://example.com)
