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

---
---
## 🔸 Lab02-Q1: Create a user account with the following attribute > Username: ali > Fullname/comment: ali iti > Password: ali

-  I will be using sudo as I'm not logged as root
- `sudo useradd -c "ali iti" -p ali ali`

---
## 🔸 Lab02-Q2: Create a user account with the following attribute > Username: baduser > Full name/comment: Bad User > Password: baduser

- `sudo useradd -c "Bad User" -p baduser baduser`

---
## 🔸 Lab02-Q3: Create a supplementary (Secondary) group called pgroup with group ID of 30000

- `groupadd -gid 30000 pgroup`

---
## 🔸 Lab02-Q4: Create a supplementary group called badgroup

- `groupadd badgroup`

---
## 🔸 Lab02-Q5: Add ali user to the pgroup group as a supplementary group

-  `sudo usermod -G pgroup ali`

---
## 🔸 Lab02-Q6: Modify the password of ali’s account to password

-  `sudo passwd ali`;`password`;`password`

---
## 🔸 Lab02-Q7: Modify ali’s account so the password expires after 30 days

-  `sudo chage -M 30 ali`

---
## 🔸 Lab02-Q8: Lock bad user account so he can't log in

-  `sudo usermod -L baduser`

---
## 🔸 Lab02-Q9: Delete bad user account

-  `sudo userdel baduser`

---
## 🔸 Lab02-Q10: Delete the supplementary group called badgroup.

-  `sudo groupdel pgroup`
