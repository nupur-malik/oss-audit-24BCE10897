#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: [NUPUR] | Roll: [24BCE10897]
# Course: Open Source Software | VITyarthi
# =============================================================

echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR — VITyarthi         "
echo "============================================================"
echo ""
echo "  You chose Python — a language born from the belief that"
echo "  code should be readable, accessible, and free for all."
echo ""
echo "  Answer three questions to generate your manifesto."
echo "------------------------------------------------------------"
echo ""

# --- Interactive input using read ---
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validate: ensure no answer is left blank ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  [!] Please answer all three questions. Re-run the script."
    exit 1
fi

# --- Date and output filename ---
DATE=$(date '+%d %B %Y')                  
OUTPUT="manifesto_$(whoami).txt"          

echo "------------------------------------------------------------"
echo "  Generating your Python open-source manifesto..."
echo ""

> "$OUTPUT"

# --- Write manifesto to file using >> (append) ---
echo "============================================================" >> "$OUTPUT"
echo "         MY OPEN SOURCE MANIFESTO — PYTHON EDITION         " >> "$OUTPUT"
echo "  Generated on : $DATE                                      " >> "$OUTPUT"
echo "  Author       : $(whoami)                                  " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Personalised paragraph using string concatenation ---
echo "  I chose Python as the subject of my open-source audit"    >> "$OUTPUT"
echo "  because it represents everything open source stands for:" >> "$OUTPUT"
echo "  a language built not for profit, but for people."         >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Every day, I use $TOOL — a tool that exists because"      >> "$OUTPUT"
echo "  someone chose to build it openly and share it freely."    >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. In software, that freedom" >> "$OUTPUT"
echo "  is what the PSF License protects: the right to run,"      >> "$OUTPUT"
echo "  read, modify, and distribute Python without restriction." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Inspired by this, I would build $BUILD and release it"    >> "$OUTPUT"
echo "  as open source — because Guido van Rossum did the same"   >> "$OUTPUT"
echo "  in 1991, and it changed the world."                       >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Open source is not just a license. It is a philosophy:"   >> "$OUTPUT"
echo "  that knowledge grows when it is shared, not hoarded."     >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $(whoami), $DATE"                                        >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Display the saved manifesto ---
echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo ""
echo "============================================================"
