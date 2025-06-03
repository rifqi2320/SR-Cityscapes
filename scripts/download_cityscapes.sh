#!/usr/bin/env bash
set -e

# ─── CONFIG ───────────────────────────────────────────────────────────────────
# Replace these with your Cityscapes website username & password:
CITYSCAPES_USER="${CITYSCAPES_USER:?Set CITYSCAPES_USER env variable}"
CITYSCAPES_PASS="${CITYSCAPES_PASS:?Set CITYSCAPES_PASS env variable}"

# Where to put the data
OUTDIR="$(dirname "$0")/../datasets/cityscapes"
mkdir -p "$OUTDIR"

# Base URL
BASE="https://www.cityscapes-dataset.com"

# ─── LOGIN ────────────────────────────────────────────────────────────────────
echo "Logging in to Cityscapes as $CITYSCAPES_USER …"
wget --quiet \
     --keep-session-cookies \
     --save-cookies "$OUTDIR/cookies.txt" \
     --post-data "username=${CITYSCAPES_USER}&password=${CITYSCAPES_PASS}&submit=Login" \
     "$BASE/login/" \
     -O /dev/null

# ─── DOWNLOAD ─────────────────────────────────────────────────────────────────
declare -A PACKAGES=(
  [1]="gtFine_trainvaltest.zip"        # fine‐annotation JSONs + label PNGs
  [3]="leftImg8bit_trainvaltest.zip" # leftImg8bit RGB images
)

for pid in "${!PACKAGES[@]}"; do
  fname="${PACKAGES[$pid]}"
  outpath="$OUTDIR/$fname"
  if [ -f "$outpath" ]; then
    echo "  › $fname already exists, skipping."
    continue
  fi

  echo "Downloading $fname (packageID=$pid)…"
  wget --show-progress \
       --load-cookies "$OUTDIR/cookies.txt" \
       --content-disposition \
       "${BASE}/file-handling/?packageID=${pid}" \
       -O "$outpath"
done

# ─── UNZIP ────────────────────────────────────────────────────────────────────
echo "Unzipping archives…"
cd "$OUTDIR"
unzip -q leftImg8bit_trainvaltest.zip
unzip -q gtFine_trainvaltest.zip

echo "All done! Your data is in $OUTDIR/{leftImg8bit,gtFine}. Now run:"
echo "    python data_prepare.py --dataset $OUTDIR"
