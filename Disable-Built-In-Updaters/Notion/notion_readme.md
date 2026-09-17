# Disable Built-In Updater — Notion

> Disables the built-in update mechanism for [Notion](https://www.notion.com/download) on macOS.

| | |
|---|---|
| **Vendor** | Notion Labs |
| **Bundle ID** | notion.id |
| **Minimum App Version Tested** | 4.0 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `NotionNoAutoUpdates` | Enforced | Boolean | `true` | Prevents Notion from automatically checking for and installing updates |

### Deployment

Deploy `notion.id.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Notion — Deploy Notion for macOS (Disable automatic updates)](https://www.notion.com/help/deploy-notion-for-macos#disable-automatic-updates)
- [Notion — Download](https://www.notion.com/download)
- [MacAdmins Slack #notion channel](https://macadmins.org)
