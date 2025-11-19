#!/bin/bash

# === Install needed packages ===
apt update -y
apt install -y acl openssl

# === Generate secure password hash for adminuser ===
ADMIN_HASH=$(openssl passwd -6 'Admin123!')

# === Create adminuser with secure hashed password ===
useradd -m -p "$ADMIN_HASH" adminuser

# === Grant adminuser sudo permissions ===
usermod -aG sudo adminuser

# === Create poweruser (no password login allowed) ===
useradd -m poweruser
passwd -d poweruser

# === Grant poweruser ONLY iptables permission ===
echo "poweruser ALL=(ALL) NOPASSWD: /sbin/iptables" > /etc/sudoers.d/poweruser
chmod 440 /etc/sudoers.d/poweruser

# === Allow poweruser to read /home/adminuser ===
chmod 700 /home/adminuser
setfacl -m u:poweruser:rx /home/adminuser

# === Create softlink /etc/mtab in poweruser home ===
ln -s /etc/mtab /home/poweruser/mtab_link
