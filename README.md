# Gemini CLI Flatpak Wrapper

This repository contains the Flatpak packaging files for the `gemini-cli` application. It is maintained separately from the source code repository to facilitate independent updates and comply with Flathub submission guidelines.

## Building Locally

To build the Flatpak locally, ensure you have `flatpak-builder` installed, then run:

```bash
flatpak-builder build-dir com.google.GeminiCLI.yml --force-clean --user --install
```

After building, you can run the application with:

```bash
flatpak run com.google.GeminiCLI --help
```

## Updating Dependencies

This repository is configured with a GitHub Actions workflow that automatically checks for new `@google/gemini-cli` npm releases every day. If a new version is found, a Pull Request is automatically generated to update the `generated-sources.json` file.

To update dependencies manually:

```bash
npm init -y && npm install @google/gemini-cli@latest
flatpak-node-generator npm package-lock.json -o generated-sources.json
rm package.json package-lock.json
```

## AppStream Metadata

The AppStream metadata file (`com.google.GeminiCLI.metainfo.xml`) provides Flathub with application details, release information, and content ratings. To ensure it passes strict Flathub linters, validate it locally before pushing:

```bash
appstreamcli validate --pedantic com.google.GeminiCLI.metainfo.xml
```

## Flathub Submission

This wrapper is structured for submission to Flathub. Pull requests should target the `new-pr` branch of your Flathub fork, and NOT contain the `.github` folder or `test.sh` script, as Flathub relies on its own buildbot infrastructure.
