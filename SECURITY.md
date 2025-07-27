### Authentication and Authorization

By default the headscale API secret is stored within the browser's `localStorage` area. While `localStorage` is not an ideal location for secrets storage, it was historically the _only_ possible method of securing data to a browser without some sort of backend facilitation. The Docker image now supports injecting the API key and server URL via environment variables, avoiding the need to manually store them in the browser.

What this means to _you_ is that when the environment variables are not used your API credentials are tied to your browser profile. If you open an incognito window or another browser profile, your API key will _not_ carry across.

`localStorage` secrets have the possibility of being exploited by XSS. This exploitation avenue is mitigated by the static nature of the site: all pages are protected by a hashsum CSP (content security protection) that prevent modifying or adding javascript from other sources.

The future state for `heascale-ui` is not to rely on `localStorage` at all, but due to the architecture, any other methods require tighter integration with the core `headscale` product. For now this is not on the headscale roadmap.

## Vulnerability Disclosure

If any method of bypassing or leaking the `localStorage` secrets is found, please contact myself directly at `chris@gurucomputing.com.au` rather than opening an issue.
