# Disable Built-In Updater — Claude Desktop

> Disables the built-in update mechanism for [Claude Desktop](https://claude.ai/download) on macOS.

| | |
|---|---|
| **Vendor** | Anthropic |
| **Bundle ID** | com.anthropic.claudefordesktop |
| **Minimum App Version Tested** | 1.3883.0 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `disableAutoUpdates` | Enforced | Boolean | `true` | Disables automatic updates of the Claude Desktop app |

### Deployment

Deploy `com.anthropic.claudefordesktop.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Claude Desktop download page](https://claude.ai/download)
- [Anthropic documentation](https://docs.claude.com/)
- [Anthropic documentation - Disable auto-updates](https://code.claude.com/docs/en/setup#disable-auto-updates)
- [MacAdmins Slack](https://macadmins.org)
