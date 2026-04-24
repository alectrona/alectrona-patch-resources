# Disable Built-In Updater — RingCentral

> Disables the built-in update mechanism and installer-side auto-launch for [RingCentral](https://www.ringcentral.com/apps/rc-app) on macOS.

| | |
|---|---|
| **Vendor** | RingCentral |
| **Bundle IDs** | com.ringcentral.glip, com.ringcentral.glip.pkg |
| **Minimum App Version Tested** | 26.1 |

---

## Configuration Profile

### Preference Keys

| Domain | Key | Configuration | Type | Value | Description |
|--------|-----|--------------|------|-------|-------------|
| `com.ringcentral.glip` | `ZAutoUpdate` | Enforced | Boolean | `false` | Disables automatic updates of the RingCentral desktop app |
| `com.ringcentral.glip.pkg` | `disableAutoLaunch` | Enforced | Integer | `1` | Prevents the RingCentral installer/updater helper from auto-launching the app after install |

### Deployment

Deploy `com.ringcentral.glip.mobileconfig` via your MDM:

- **Jamf Pro:** Upload via Settings → Configuration Profiles, scope to target computers
- **Addigy:** Profiles → Add Profile → upload `.mobileconfig`
- **Iru:** Library → Add → Custom Profile
- **Microsoft Intune:** Devices → macOS → Configuration Profiles → Create → Templates → Custom

---

## References

- [RingCentral app download page](https://www.ringcentral.com/apps/rc-app)
- [RingCentral app lifecycle policy ](https://support.ringcentral.com/article-v2/The-RingCentral-app-lifecycle-policy.html?brand=RingCentral&product=RingEX&language=en_US&pills-nav=admin)
- [RingCentral Manage auto-launch after app installation](https://support.ringcentral.com/article-v2/managing-auto-launch-after-ringcentral-app-installation-on-a-mac.html?brand=RingCentral&product=RingEX&language=en_US)
- [MacAdmins Slack #ringcentral channel](https://macadmins.org)
