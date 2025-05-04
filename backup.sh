#!/bin/bash
set -e

DATA_PATH="/data"
ZIP_NAME="full-volume-$(date +%F).zip"
TMP_ZIP="/tmp/$ZIP_NAME"

# 📦 Zazipujeme celý objem
cd "$DATA_PATH"
zip -r "$TMP_ZIP" .

# ☁️ Nahrajeme na 0x0.st
echo "Uploading $ZIP_NAME to 0x0.st..."
UPLOAD_URL=$(curl -s -F "file=@$TMP_ZIP" https://0x0.st)

echo "✅ Upload complete:"
echo "$UPLOAD_URL"
