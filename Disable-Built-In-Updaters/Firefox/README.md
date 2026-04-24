# Disable Built-In Updater — Firefox

> Disables the built-in update mechanism for [Firefox](https://www.mozilla.org/firefox/) on macOS.

| | |
|---|---|
| **Vendor** | Mozilla |
| **Bundle ID** | org.mozilla.firefox |
| **Minimum App Version Tested** | 150 |

---

## Configuration Profile

### Preference Keys

| Key | Configuration | Type | Value | Description |
|-----|--------------|------|-------|-------------|
| `DisableAppUpdate` | Enforced | Boolean | `true` | Disables the built-in Firefox application updater |
| `EnterprisePoliciesEnabled` | Enforced | Boolean | `true` | Required to enable enterprise policy enforcement, including `DisableAppUpdate` |

> `EnterprisePoliciesEnabled` must be `true` for Firefox to honor any other policy-based preferences, including `DisableAppUpdate`.

### Deployment

Deploy `org.mozilla.firefox.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [Firefox Enterprise — Policy documentation](https://mozilla.github.io/policy-templates/)
- [Firefox for Enterprise](https://www.mozilla.org/firefox/enterprise/)
- [MacAdmins Slack #firefox channel](https://macadmins.org)
