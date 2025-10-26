/env bash
# ================================================
# forensic_mount_report.sh
# Author: Forensic Investigator
# Purpose: Generate forensic mount point metadata report
# Date: $(date)
# ================================================

OUTPUT_MD="mount_report_$(date +%Y%m%d_%H%M%S).md"
OUTPUT_CSV="mount_report_$(date +%Y%m%d_%H%M%S).csv"

echo "============================================"
echo " Forensic Mount Metadata Collection Script"
echo "============================================"
echo

# Header for Markdown
cat <<EOF > "$OUTPUT_MD"
# 🧾 Forensic Mount Metadata Report
**Date of Capture:** $(date)
**System:** $(hostname)
**Collector:** $(whoami)

| Device | Label | UUID | FSType | Mount Point | Mount Time | Owner | Remarks |
|---------|--------|-------|--------|--------------|-------------|--------|----------|
EOF

# Header for CSV
echo "Device,Label,UUID,FSType,MountPoint,MountTime,Owner,Remarks" > "$OUTPUT_CSV"

# Collect data using lsblk
lsblk -rno NAME,LABEL,UUID,FSTYPE,MOUNTPOINT | while read -r name label uuid fstype mnt; do
    # Skip empty mount points
    [ -z "$mnt" ] && continue

    dev="/dev/$name"
    owner=$(stat -c '%U' "$mnt" 2>/dev/null || echo "root")

    # Extract mount time from journalctl (if available)
    mount_time=$(journalctl --no-pager | grep "Mounted $mnt" | tail -n1 | awk '{print $1, $2, $3}' || echo "N/A")

    # Quick remarks
    case "$fstype" in
        vfat|exfat)
            remark="Removable or cross-platform media"
            ;;
        ext4|xfs|btrfs)
            remark="Primary or secondary Linux filesystem"
            ;;
        squashfs)
            remark="Immutable Snap or app image"
            ;;
        tmpfs)
            remark="Volatile temporary filesystem"
            ;;
        *)
            remark="System or virtual mount"
            ;;
    esac

    # Append to Markdown
    echo "| $dev | ${label:-N/A} | ${uuid:-N/A} | ${fstype:-N/A} | ${mnt:-N/A} | ${mount_time:-N/A} | ${owner:-N/A} | $remark |" >> "$OUTPUT_MD"

    # Append to CSV
    echo "$dev,${label:-N/A},${uuid:-N/A},${fstype:-N/A},${mnt:-N/A},${mount_time:-N/A},${owner:-N/A},$remark" >> "$OUTPUT_CSV"
done

echo
echo "✅ Forensic mount report generated:"
echo " - Markdown: $OUTPUT_MD"
echo " - CSV: $OUTPUT_CSV"
echo
echo "Tip: Open Markdown report in any viewer or GitHub; import CSV into Excel or forensic database."






