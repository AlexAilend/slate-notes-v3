# Deploy Slate Notes v3

Set the Pages source to GitHub Actions. A push to `main` runs the Deploy v3 Pages workflow. It checks the JavaScript and publishes the frontend. The workflow can also be started manually from Actions.

The v3 frontend uses its own Supabase project. Upload exhibits to its private `exhibits` bucket using the object names referenced in `banks.js`.
