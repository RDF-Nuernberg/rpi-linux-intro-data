#!/bin/bash
set -e  # Exit immediately on any error

# ============================
# Configuration
# ============================
REPO_NAME="rpi-linux-intro-data"  # <-- change this if your repo name differs
BRANCH="main"                     # you can also change to "dev" or another branch

echo "📦 Setting up Raspberry Pi environment for user: $USER"
echo "→ Repository: $REPO_NAME (branch: $BRANCH)"

# --- Step 1: Create temporary directory and ensure cleanup ---
TMP_DIR=$(mktemp -d)
cleanup() {
    rm -rf "$TMP_DIR"
    echo "🧹 Cleaned up temporary files."
}
trap cleanup EXIT  # always run cleanup on exit (success or failure)

# --- Step 2: Download repo ZIP ---
echo "→ Downloading repository archive..."
curl -L "https://github.com/RDF-Nuernberg/$REPO_NAME/archive/refs/heads/$BRANCH.zip" -o "$TMP_DIR/repo.zip"

# --- Step 3: Unpack ---
echo "→ Extracting files..."
unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"
cd "$TMP_DIR/$REPO_NAME-$BRANCH"

# --- Step 4: Copy files to destinations ---
echo "→ Copying logs folder to ~/Downloads/logs ..."
mkdir -p /home/$USER/Downloads/logs
cp -r logs/* /home/$USER/Downloads/logs/

echo "→ Copying scripts to ~/Projects/smart-sensor-network ..."
mkdir -p /home/$USER/Projects/smart-sensor-network
cp -r scripts/* /home/$USER/Projects/smart-sensor-network/

echo "✅ Setup complete!"
