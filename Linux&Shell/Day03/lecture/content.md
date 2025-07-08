# 🐧 Linux & Shell – Day 03 Headlines

## 🔹 More about Ownership and Permissions
- Introduction to `umask`
- Sets default permissions for new files and directories
- Written as four digits, e.g., `0002`
  - First digit: special permissions (usually 0)
  - Last three: subtracted from 777 to calculate new permissions
  - Example: `umask 0022` → default permissions = 755

## 🔹 VIM
- Lightweight, powerful text editor
- Modes:
  - **Normal mode** – for navigation and commands
  - **Insert mode** – for typing (`i`, `a`, `o` to enter)
  - **Command mode** – for saving, quitting, etc.
- Example commands:
  - `:w` → Save  
  - `:q` → Quit  
  - `:wq` or `ZZ` → Save & Quit  
  - `:q!` → Force Quit without saving

## 🔹 Alias
- Shortcut for long or frequent commands
- Examples:
  - `alias ll='ls -alF'`
  - `alias gs='git status'`

## 🔹 Patterns and Special Characters
- Used for filename expansion (globbing) in the shell:
  - `*` → matches any number of characters (`*.txt`)
  - `?` → matches a single character (`file?.txt`)
  - `[]` → matches a set/range of characters (`file[1-3].txt`)
  - `\` → escapes special characters

## 📚 Reference
[📘 Red Hat RH124 – System Administration I (PDF)](https://ipcompro.net/IpComPro/Training-Materials/Linux/Books/Red%20Hat%20RHCSA-RHCE%208%20-%20Offical%20Cert%20Guide/Red%20Hat%20Enterprise%20Linux%208.0%20RH124%20-%20Red%20Hat%20System%20Administration%20I.%201-2019.pdf)
