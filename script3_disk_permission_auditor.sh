#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
#Author: [NUPUR] | Roll: [24BCE10897]
# Course: Open Source Software | VITyarthi


# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR — SYSTEM REPORT       "
echo "============================================================"
printf "%-25s %-22s %-10s\n" "Directory" "Perms (Owner:Group)" "Size"
echo "------------------------------------------------------------"

# --- For loop: iterate over each directory in the list ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

       
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-25s %-22s %-10s\n" "$DIR" "$PERMS ($OWNER:$GROUP)" "$SIZE"
    else
        printf "%-25s %-22s\n" "$DIR" "[Does not exist]"
    fi
done

echo "------------------------------------------------------------"
echo ""

# --- Python-Specific Directory Audit ---
echo "  --- Python-Specific Installation Audit ---"
echo ""

# Find where python3 binary lives
PYTHON_BIN=$(which python3 2>/dev/null)
if [ -n "$PYTHON_BIN" ]; then
    PERMS=$(ls -l "$PYTHON_BIN" | awk '{print $1, $3, $4}')
    echo "  [✔] Python binary   : $PYTHON_BIN"
    echo "      Permissions      : $PERMS"
else
    echo "  [!] Python binary not found in PATH."
fi

echo ""

# Check Python standard library directory
PYTHON_LIB=$(python3 -c "import sys; print(sys.prefix + '/lib')" 2>/dev/null)
if [ -d "$PYTHON_LIB" ]; then
    SIZE=$(du -sh "$PYTHON_LIB" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$PYTHON_LIB" | awk '{print $1, $3, $4}')
    echo "  [✔] Python lib dir  : $PYTHON_LIB"
    echo "      Permissions      : $PERMS"
    echo "      Size             : $SIZE"
else
    echo "  [!] Python lib directory not found."
fi

echo ""

# Check site-packages (where pip installs third-party packages)
SITE_PKG=$(python3 -c "import site; print(site.getsitepackages()[0])" 2>/dev/null)
if [ -d "$SITE_PKG" ]; then
    SIZE=$(du -sh "$SITE_PKG" 2>/dev/null | cut -f1)
    PERMS=$(ls -ld "$SITE_PKG" | awk '{print $1, $3, $4}')
    echo "  [✔] site-packages   : $SITE_PKG"
    echo "      Permissions      : $PERMS"
    echo "      Size             : $SIZE"
else
    echo "  [!] site-packages directory not found."
fi

echo ""
echo "============================================================"
