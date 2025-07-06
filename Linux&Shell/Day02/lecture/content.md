# 🐧 Linux & Shell – Day 02 Headlines

## 🔹 Files & Directories Basics
- Navigating the file system using `cd`, `ls`, `pwd`
- Creating/removing files with `touch`, `rm`
- Creating/removing directories with `mkdir`, `rmdir`
- Copying files and directories using `cp`
- Moving/renaming files and directories using `mv`

## 🔹 Users and Group Administration
- Viewing users with `cat /etc/passwd`
- Viewing groups with `cat /etc/group`
- Understanding primary vs. secondary groups
- Each user in `/etc/passwd` has 7 fields: `login name; password placeholder; UID; GID; user info (GECOS); home directory; shell`
- Each user belongs to one **primary group** (defined by GID) and can be part of multiple **secondary groups** for additional permissions.
- 

### 🔹 User Management Commands

| Command | Description |
|--------|-------------|
| `sudo adduser username` | Add new user (with home, password prompt) |
| `sudo useradd username` | Add new user (manual setup) |
| `sudo passwd username` | Set/change user password |
| `sudo userdel username` | Delete user |
| `sudo userdel -r username` | Delete user and home directory |
| `sudo usermod -c "comment" username` | Add/change user info (GECOS) |
| `sudo usermod -e YYYY-MM-DD username` | Set account expiration date |
| `sudo usermod -L username` | Lock user account |
| `sudo usermod -U username` | Unlock user account |
| `sudo chage -M 90 username` | Set password to expire in 90 days |

### 🔹 Group Management Commands

| Command | Description |
|--------|-------------|
| `sudo groupadd groupname` | Create new group |
| `sudo groupdel groupname` | Delete a group |
| `sudo usermod -g groupname username` | Change user’s primary group |
| `sudo usermod -aG groupname username` | Add user to a secondary group |
| `groups username` | Show user groups |
| `id username` | Show UID, GID, and groups |
| `getent group groupname` | View group info from system database |

## 🔹 Ownership and Permissions
- Permissions in `ls -l` appear as:  
  `-rwxr-xr--` → where:
  - First character: file type (`-` for file, `d` for directory, `l` for symlink)
  - Next 3: owner permissions (read `r`, write `w`, execute `x`)
  - Next 3: group permissions
  - Last 3: others (everyone else)
  - The "-" means this permission is not given "rw-" so x is not given
- Changing owner: `chown`
- Changing group: `chgrp`
- Modifying permissions: `chmod` (symbolic and numeric)
  
## 🔹 Shutdown and Reboot
- Shutdown system: `shutdown -h now`, `poweroff`, `systemcl powerof`
- Reboot system: `reboot`, `shutdown -r now`, `systemcl reboot`
- Scheduling shutdown: `shutdown +10 "System will shut down in 10 minutes"`

## 📚 Reference  
[📘 Red Hat RH124 – System Administration I (PDF)](https://ipcompro.net/IpComPro/Training-Materials/Linux/Books/Red%20Hat%20RHCSA-RHCE%208%20-%20Offical%20Cert%20Guide/Red%20Hat%20Enterprise%20Linux%208.0%20RH124%20-%20Red%20Hat%20System%20Administration%20I.%201-2019.pdf)
