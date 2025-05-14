#!/bin/bash

# makepkg.sh - fixsecure Packaging Automation Script

# === CONFIGURATION ===
SCRIPT_NAME="fixsecure"
PKG_IDENTIFIER="com.sewanee.fixsecure"
OUTPUT_DIR="$PWD/output"
BUILD_DIR="$PWD/PackagingPayload"

# === USAGE CHECK ===
if [[ -z "$1" ]]; then
    echo "Usage: ./makepkg.sh <version>"
    echo "Example: ./makepkg.sh 1.2"
    exit 1
fi

VERSION="$1"

# === CLEAN BUILD FOLDER ===
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/usr/local/bin"
mkdir -p "$OUTPUT_DIR"

# === COPY SCRIPT + SET PERMISSIONS ===
cp "$SCRIPT_NAME" "$BUILD_DIR/usr/local/bin/$SCRIPT_NAME"
chmod 755 "$BUILD_DIR/usr/local/bin/$SCRIPT_NAME"

echo "✅ Copied $SCRIPT_NAME into packaging folder."

# === BUILD PKG ===
pkgbuild --root "$BUILD_DIR" \
--identifier "$PKG_IDENTIFIER" \
--version "$VERSION" \
--install-location / \
"$OUTPUT_DIR/${SCRIPT_NAME}_installer_v${VERSION}.pkg"

echo "✅ Package created: $OUTPUT_DIR/${SCRIPT_NAME}_installer_v${VERSION}.pkg"
echo "🎉 Done. Go upload it to Intune (or test locally first)."
