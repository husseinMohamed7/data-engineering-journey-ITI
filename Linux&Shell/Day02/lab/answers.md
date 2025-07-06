<h1 align="center">Day 02 – Linux & Shell</h1>
<h3 align="center">ITI Minya – Round 1</h3>
<h3 align="center">Name: Hussein Mohamed</h3>

---

## 🔸 Lab01-Q4: Create the following hierarchy under your home directory:
<h3 align="center"> (docs>mycv), (dir1>((dir11>file1), dir12)</h3>

- `pwd` > /home/h; all work done in my home dir
- to make the mycv inside docs
  - `mkdir docs`
  - `touch docs/mycv`
- to make the dir1 and it's insiders
  - `mkdir dir1 dir1/dir11 dir1/dir12; touch dir1/dir11/file1`
  - `tree` will show
    - dir1  
      - dir11  
          - file1  
      - dir12
---
### Q4-a: Remove dir11 in one-step. What did you notice? And how did you overcome that?

- `rm -r dir1/dir11`; notice `-r` is required to delete a directory and it's contnet  
---
### Q4-b: Then remove dir12 using rmdir –p command. State what happened to the hierarchy.

- `rmdir -p dir1/dir12`
- the dir1 was also removed so '-p' removes the parent dir
---
### Q4-c: The output of the command pwd was /home/user. Write the absolute and relative path for the file mycv

- absolute path: /home/h/docs/mycv
- relative path: docs/mycv 

---
## 🔸 Lab01-Q5: Copy the /etc/passwd file to your home directory making its name is mypasswd.

- `cp /etc/passwd /home/h/mypasswd`

---
## 🔸 Lab01-Q6: Rename this new file to be oldpasswd.

- `pwd` > /home/h
- `mv mypasswd oldpasswd`

