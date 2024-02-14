#!/bin/bash

sudo dnf update
sudo dnf upgrade

sudo dnf --refresh update 

sudo dnf install dnf-plugin-system-upgrade
sudo dnf install rpmconf
sudo rpmconf -a
sudo mount | grep "/boot "
/dev/sda4 on /boot type ext4 (rw,relatime,seclabel)
sudo grub2-install /dev/sda
sudo dnf system-upgrade download --releasever=39

sudo dnf install remove-retired-packages
remove-retired-packages

sudo dnf repoquery --unsatisfied
sudo dnf remove --duplicates

sudo dnf list extras
sudo dnf remove $(sudo dnf repoquery --extras --exclude=kernel,kernel-\*)
sudo dnf autoremove


old_kernels=($(dnf repoquery --installonly --latest-limit=-1 -q))
if [ "${#old_kernels[@]}" -eq 0 ]; then
    echo "No old kernels found"
    exit 0
fi

if ! dnf remove "${old_kernels[@]}"; then
    echo "Failed to remove old kernels"
    exit 1
fi

echo "Removed old kernels"
exit 0

sudo dnf install symlinks
sudo symlinks -r /usr | grep dangling
sudo symlinks -r -d /usr
sudo rm /boot/*rescue*
sudo kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"
sudo dnf install dracut-config-rescue
sudo rpm --rebuilddb
sudo dnf distro-sync
sudo dnf distro-sync --allowerasing

sudo fixfiles -B onboot




sudo dnf system-upgrade reboot

