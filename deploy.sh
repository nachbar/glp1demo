#!/bin/sh
# Regenerate CSP hashes, then deploy to Netlify production.
set -e
cd "$(dirname "$0")"
node tools/build-csp.mjs
netlify deploy --prod --dir . --no-build
