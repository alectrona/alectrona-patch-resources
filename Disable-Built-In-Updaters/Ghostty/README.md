# Disable Built-In Updater — Ghostty

> Disables the built-in update mechanism for [Ghostty](https://ghostty.org) on macOS.

| | |
|---|---|
| **Vendor** | Mitchell Hashimoto |
| **Bundle ID** | com.mitchellh.ghostty |
| **Minimum App Version Tested** | 1.3.1 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `SUEnableAutomaticChecks` | Enforced | Boolean | `false` | Disables Sparkle's automatic update checks in Ghostty |

> Ghostty uses the [Sparkle](https://sparkle-project.org/documentation/customization/) update framework on macOS, so the standard `SUEnableAutomaticChecks` preference key applies.

### Deployment

Deploy `com.mitchellh.ghostty.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Ghostty documentation](https://ghostty.org/docs)
- [Ghostty auto-update option reference](https://ghostty.org/docs/config/reference#auto-update)
- [Sparkle framework — Customizing updater behavior](https://sparkle-project.org/documentation/customization/)
- [MacAdmins Slack](https://macadmins.org)
