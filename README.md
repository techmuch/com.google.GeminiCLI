# Gemini CLI Flatpak Wrapper

This repository contains the Flatpak packaging files for the `gemini-cli` application. It is maintained separately from the source code repository to facilitate independent updates and comply with Flathub submission guidelines.

## Building

To build the Flatpak locally, ensure you have `flatpak-builder` installed, then run:

```bash
flatpak-builder build-dir com.google.GeminiCLI.yml --force-clean --user --install
```

## Updating Dependencies

When a new version of `gemini-cli` is released, update the Flatpak dependencies by rerunning the generator tool. 

According to your requirements, run the following:

```bash
flatpak-node-generator npm @google/gemini-cli -o generated-sources.json
```

*(Note: If `flatpak-node-generator` requires a lockfile, you may need to run `npm init -y && npm install @google/gemini-cli` first, and then run `flatpak-node-generator npm package-lock.json -o generated-sources.json`)*

After updating, commit the changes to trigger a new Flatpak build.
