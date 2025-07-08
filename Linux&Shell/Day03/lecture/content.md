# 🐧 Linux & Shell – Day 03 Headlines

## 🔹 More about Ownership and Permissions
- Each file or directory has 3 sets of permissions:
  - **Owner**, **Group**, and **Others**
  - Each set includes:
    - `r` – read
    - `w` – write
    - `x` – execute
- Example: `-rwxr-xr--`
  - Owner: `rwx` → can read, write, execute
  - Group: `r-x` → can read and execute
  - Others: `r--` → read only
- `chmod` is used to change permissions:
  - **Symbolic method**:
    - `chmod u+x file.txt` → add execute for user (owner)
    - `chmod g-w file.txt` → remove write from group
  - **Numeric method** (based on adding values):
    - `r = 4`, `w = 2`, `x = 1`
    - `chmod 755 file.txt` → `rwxr-xr-x`
    - `chmod 644 file.txt` → `rw-r--r--`
- Permissions For **directories**:
  - `r` means: can list contents (`ls`)
  - `w` means: can create/delete files inside
  - `x` means: can enter (cd into) the directory
- Permissions For **files**:
  - `r` → can view the content
  - `w` → can edit or overwrite the file
  - `x` → can execute the file if it's a script or program
    
- Introduction to `umask`
- Sets default permissions for new files and directories
- Written as four digits, e.g., `0002`
  - First digit: special permissions (usually 0)
  - Last three: subtracted from 777 to calculate new permissions
  - Example: `umask 0022` → default permissions = 755
- `chown` – Used to change the **owner** and/or **group** of a file or directory.
- chown [NEW_OWNER][:NEW_GROUP] file
- `chown -R` > Applies the ownership change to all files and subdirectories inside a directory. 

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
