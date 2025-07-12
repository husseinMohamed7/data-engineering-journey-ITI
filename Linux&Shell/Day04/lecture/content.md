# 🐧 Linux & Shell – Day 04 Headlines

## 🔹 Variables
- Define a variable: `name="Hussein"` (no spaces around `=`)
- Access it: `$name` or `${name}`
- Export variable: `export name="Hussein"` → makes it available to subprocesses
- Unset variable: `unset name`

## 🔹 Environment Variables
- Common examples: `PATH`, `HOME`, `USER`, `SHELL`
- View all: `env`, `printenv`
- View one: `echo $PATH`
- Set temporarily: `export VAR=value`
- Set permanently:
  - User level: `~/.bashrc` or `~/.bash_profile`
  - System level: `/etc/environment`

## 🔹 Pattern Matching and Special Characters
- `*` matches any number of characters  
- `?` matches a single character  
- `[]` matches a character set (e.g., `[abc]`)  
- `[^]` negates a set (e.g., `[^a-z]`)  
- Quotes:
  - `"` → allows expansion of variables
  - `'` → disables all expansions
  - `\` → escapes the next character

## 🔹 Processes
- Show current processes: `ps`, `ps aux`, `top`, `htop`
- Show process tree: `pstree`
- Run in background: `command &`
- Bring background process to foreground: `fg`
- Kill process: `kill PID`, `kill -9 PID`
- Find process: `pgrep`, `pidof`, `ps aux | grep name`

## 🔹 Redirection
- Redirect output: `>` (overwrite), `>>` (append)
- Redirect input: `<`
- Redirect stderr: `2>`
- Redirect both stdout and stderr: `command > out.txt 2>&1`

## 🔹 Pipeline – `wc`, `diff`, `cut`, `sort`
- `|` passes output of one command as input to the next
- `wc`: word/line/char count → `wc -l file.txt`
- `diff`: compare files line by line → `diff file1 file2`
- `cut`: extract columns → `cut -d':' -f1 /etc/passwd`
- `sort`: sort lines → `sort file.txt`

## 🔹 gpep (grep, pipe, echo, pwd)
- `grep`: search text using patterns → `grep "root" /etc/passwd`
- `echo`: print to terminal → `echo $USER`
- `pwd`: print working directory
- Combine with pipes → `ps aux | grep firefox`
