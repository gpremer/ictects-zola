#!/usr/bin/env bash

set -euo pipefail

# Publishes to cloudflare if the repo is clean

if output=$(git status --porcelain) && [ -z "$output" ]; then
    echo Working directory clean. Publishing to Cloudflare
    nix build
    wrangler pages publish --project-name ictects result
else
    echo Uncommitted changes. Not publishing to Cloudflare
    exit 1
fi
