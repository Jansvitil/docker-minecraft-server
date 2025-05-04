#!/bin/bash
set -e

DATA_PATH="/data"
ZIP_NAME="full-volume-$(date +%F).zip"
TMP_DIR="/tmp"
REPO="Jansvitil/zachrana-paulieho"

cd $DATA_PATH
zip -r "$TMP_DIR/$ZIP_NAME" .

cd $TMP_DIR
git clone https://"$GITHUB_TOKEN"@github.com/$REPO backup-repo
cd backup-repo
cp "../$ZIP_NAME" .
git config user.name "Railway Backup Bot"
git config user.email "railway@backup.bot"
git add "$ZIP_NAME"
git commit -m "Full volume backup on $(date +%F)"
git push origin main
