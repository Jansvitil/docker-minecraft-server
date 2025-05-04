#!/bin/bash
set -e

# 📁 Co a kam
DATA_PATH="/data"
ZIP_NAME="full-volume-$(date +%F).zip"
TMP_ZIP="/tmp/$ZIP_NAME"

# 📦 Vytvoříme ZIP celé složky /data
cd "$DATA_PATH"
zip -r "$TMP_ZIP" .

# ☁️ Nahrajeme na transfer.sh
echo "Uploading $ZIP_NAME to transfer.sh..."
UPLOAD_URL=$(curl --upload-file "$TMP_ZIP" https://transfer.sh/$ZIP_NAME)

echo "✅ Upload completed:"
echo "$UPLOAD_URL"
