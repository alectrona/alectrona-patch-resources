# Disable Built-In Updater — Zoom

> Disables the built-in update mechanism for the [Zoom Workplace](https://zoom.us/download) desktop client on macOS.

| | |
|---|---|
| **Vendor** | Zoom Communications |
| **Bundle ID** | us.zoom.xos |
| **Preferences Domain** | us.zoom.config |
| **Minimum App Version Tested** | 7.0 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `ZAutoUpdate` | Enforced | Boolean | `false` | Disables automatic updates of the Zoom desktop client |

> Zoom writes its managed preferences to the `us.zoom.config` domain, which is separate from the app's bundle identifier `us.zoom.xos`. The profile targets the `us.zoom.config` preferences domain.
>
> In addition, while the `ZAutoUpdate` key is no longer listed on Zoom's management settings table, it continues to work as expected.

### Deployment

Deploy `us.zoom.config.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Zoom — Mass deployment with preconfigured settings for macOS](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0064957)
- [Zoom Workplace download page](https://zoom.us/download)
- [MacAdmins Slack #zoom channel](https://macadmins.org)
