#!/bin/bash
set -e

# Run the flatpak binary and check for a successful exit code
flatpak run com.google.GeminiCLI --help
