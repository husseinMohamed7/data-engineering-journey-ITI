# 🐧 Linux & Shell – Day 05 Headlines

## 🔹 cut
- Extract specific columns or characters from each line.
- Use `-d` to set a delimiter, `-f` for fields, `-c` for characters.
- Examples:
  - `cut -d ":" -f1 /etc/passwd` → extract first field (username)
  - `cut -c1-5 file.txt` → extract characters 1 to 5 from each line

## 🔹 sort
- Sort lines alphabetically or numerically.
- Flags:
  - `-n` → numerical sort
  - `-r` → reverse order
  - `-u` → remove duplicates
- Examples:
  - `sort names.txt`
  - `sort -nr numbers.txt`
  - `sort -u list.txt`

## 🔹 grep
- Search for patterns or words inside files.
- Flags:
  - `-i` → case-insensitive
  - `-n` → show line numbers
  - `-r` → recursive search
- Examples:
  - `grep "error" logs.txt`
  - `grep -i "hello" file.txt`
  - `grep -rn "main" .`

## 🔹 find
- Search for files/directories based on conditions.
- Common options:
  - `-name`, `-type`, `-size`, `-mtime`
- Examples:
  - `find /home -name "*.sh"`
  - `find . -type d`
  - `find . -size +1M`
  - `find . -mtime -1`

## 🔹 sudors
- `sudoers` file controls who can use `sudo`.
- Edit it safely using:
  - `sudo visudo`
- Example entry:
  - `hussein ALL=(ALL:ALL) ALL` → gives full sudo access

## 🔹 Compressing and Archiving
- `tar` is used to archive and compress files.
- Examples:
  - `tar -cvf archive.tar folder/`
  - `tar -czvf archive.tar.gz folder/`
  - `tar -xzvf archive.tar.gz`
- `zip` and `unzip`:
  - `zip archive.zip file1 file2`
  - `unzip archive.zip`

## 🔹 Intro to Bash Script
- Bash scripts start with `#!/bin/bash`
- Example:
  ```bash
  #!/bin/bash
  echo "Hello, World!"
Save the file, then:
```
chmod +x script.sh
./script.sh
```

## 🔹 Intro to Bash Script

```
name="Hussein"
echo "Hi, $name"
```

## 🔹 test or [ ] in Bash

- What is `test` or `[ ]`
- Syntax Rules
- File Conditions
- String Comparisons
- Numeric Comparisons
- Using with `if` Statements
- Common Operators Summary
- Tip: Use `[[ ]]` for advanced conditions
