I needed multiple locations for my evohome setup in Home Assistant. This requires that multiple custom components are set up per location.
No changes to the integration are made

This repository checks the ha_core daily and:
- pulls evohome integration 
- modify it into custom integration
- releases new version if changes have been detected

All actions are done by workflow: https://github.com/madcowGit/evohome_cc1/blob/main/.github/workflows/run-on-ha-core-update.yml

## Installation

### HACS (as a custom repository)

1. In Home Assistant, open **HACS → Integrations**.  
2. Click **⋯ (three dots)** → **Custom repositories**.  
3. Paste `https://github.com/madcowGit/evhohome_cc1` and select **Type: Integration**, then click **Add**.  
4. Back in HACS, search for **Honeywell Total Connect Comfort (Europe) (evohome_cc1 custom component)** and click **Install**.  
5. Restart Home Assistant when prompted.

### YAML configuration (required)
This still requires that integration is configured in configuration.yaml
see: https://www.home-assistant.io/integrations/evohome/

```
evohome_cc1:
    username: <Honeywell Total Connect Comfort (Europe) email>
    password: <your password>
    location_idx: 1
```

## Acknowledgements
- original evohome integration and script to create additional custom_components: https://gist.github.com/zxdavb/d898e594091753d703c858c9accc59d2
- manual steps to create additional integration are outlined here: https://github.com/zxdavb/evohome-async/wiki/Hass:-Multiple-Evohome-Locations
