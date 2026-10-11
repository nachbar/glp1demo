# GLP-1 Tracker (demo)

A single-page demo app for tracking patients on GLP-1 medications
(semaglutide or tirzepatide): patient list, per-patient visit history,
weight chart with dose-change markers, BMI, and a flag for patients who
have lost more than 20% of their starting weight.

**Demo only.** All data lives in the browser's localStorage. Nothing is
sent anywhere, and nothing is shared between devices. It is not suitable
for real patient data as-is (see the security notes at the end).

Live: https://glp1demo.netlify.app

## Files

| File | Purpose |
|---|---|
| `index.html` | The whole app: markup, styles, and script in one file |
| `netlify.toml` | Netlify publish directory and security headers (generated, see below) |
| `tools/build-csp.mjs` | Computes the Content-Security-Policy hashes and rewrites `netlify.toml` |
| `deploy.sh` | Regenerates the CSP, then deploys to Netlify production |

## Running locally

Any static file server works:

```sh
python3 -m http.server 8765
# then open http://localhost:8765/
```

The CSP header is only applied by Netlify, so a local server will not
enforce it. To test the policy locally, serve `index.html` with the
`Content-Security-Policy` value from `netlify.toml` as a response header.

## Deploying

Prerequisites, one time only:

```sh
npm install -g netlify-cli
netlify login
netlify link          # pick the existing "glp1demo" site
```

Every deploy:

```sh
./deploy.sh
```

That runs two steps:

1. `node tools/build-csp.mjs` hashes the inline `<style>` and `<script>`
   blocks in `index.html` and writes the hashes into the
   `Content-Security-Policy` line of `netlify.toml`.
2. `netlify deploy --prod --dir . --no-build` uploads the directory.

**Always deploy through the script.** Any edit to the style or script
blocks changes their hashes. If you run `netlify deploy` directly after
such an edit, the site ships with a stale policy, the browser refuses
to run the page's own script, and the app renders blank.

To preview a deploy without touching production, run the CSP step and
then `netlify deploy --dir . --no-build` (no `--prod`); Netlify prints a
unique draft URL.

## Content-Security-Policy

The policy allows only the page's own inline script and stylesheet (by
SHA-256 hash), same-origin images, and the inline data-URI favicon. It
denies frames, forms, network connections, and `<base>` changes.

Consequences:

- Inline `style="..."` attributes are blocked. Use CSS classes instead.
- Inline event handlers (`onclick="..."`) are blocked. Attach handlers
  from the script.
- Netlify's free-plan "Powered by Netlify" badge script is blocked too,
  so the badge does not show and the console logs one refused-script
  message. To allow it, add `'self'` to `script-src` in
  `tools/build-csp.mjs`.

## Netlify site settings

- Site name: `glp1demo` (team: nachbar's team).
- The team has "protect all sites with Netlify login" enabled. This
  site has that protection turned off at the site level so the link
  works without logging in. If a future site returns a login page,
  disable `sso_login` for that site in the Netlify UI or with
  `netlify api updateSite`.

## Demo data

Five made-up patients load on first visit. The list page has a
"Delete demo patients" button that removes only those. If the built-in
demo data set changes (bump `DEMO_VER` in `index.html`), existing demo
patients are swapped for the new set on next load; patients added by
hand are kept, and deleted demo patients do not come back.

## Before real patient data

This app stores plaintext data in localStorage with no login, no audit
trail, no backups, and no encryption at rest. A production version
needs a backend with authentication, access control, audit logging,
encrypted storage, backups, and a hosting provider willing to sign a
Business Associate Agreement. Treat this repo as a workflow prototype.
