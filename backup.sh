#!/bin/bash
set -e

# 🗂️ Cesty
DATA_PATH="/data"
ZIP_NAME="full-volume-$(date +%F).zip"
TMP_DIR="/tmp"

# 🐙 GitHub repozitář pro zálohu (změň na své uživatelské jméno a název repa!)
REPO="Jansvitil/zachrana-paulieho"

# 💾 Zazipujeme celý obsah připojeného volume
cd "$DATA_PATH"
zip -r "$TMP_DIR/$ZIP_NAME" .

# 🧹 Smažeme starý adresář, pokud existuje
cd "$TMP_DIR"
rm -rf backup-repo

# ⬇️ Klonujeme repozitář a přesuneme se do něj
git clone https://"$GITHUB_TOKEN"@github.com/$REPO backup-repo
cd backup-repo

# ➕ Přidáme ZIP soubor a commitneme
cp "../$ZIP_NAME" .
git config user.name "Railway Backup Bot"
git config user.email "railway@backup.bot"
git add "$ZIP_NAME"
git commit -m "Full volume backup on $(date +%F)"
git push origin main
