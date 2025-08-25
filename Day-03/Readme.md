
# Disk Monitoring Script (Shell Scripting)

##  Task

Create a shell script to **monitor disk usage** using `df -h` and log the results to a file.

---

##  Key Concepts Learned

### 1. `df -h` Command

* `df` shows disk usage (disk free).
* `-h` → human-readable format (GB, MB).
* Example:

  ```bash
  df -h
  ```

  Output:

  ```
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda1        50G   20G   28G  42% /
  ```

### 2. Extracting Specific Columns with `awk`

* `awk '{print $6}'` → extracts the **Use%** column.
* Example:

  ```bash
  df -h | grep "/dev/sda1" | awk '{print $5}'
  ```

  Output:

  ```
  42%
  ```

### 3. Removing Special Characters with `sed`

* `sed 's/%//'` removes the `%` symbol.
* Example:

  ```bash
  echo "42%" | sed 's/%//'
  ```

  Output:

  ```
  42
  ```

### 4. Variables in Shell Script

* Assigning value:

  ```bash
  threshold=80
  ```
* Using variable inside echo:

  ```bash
  echo "Threshold is $threshold%"
  ```

### 5. Conditional Check (`if`)

* `[ ]` is used for conditions in Bash.
* Must have spaces after `[` and before `]`.
* Example:

  ```bash
  if [ "$current_usage" -gt "$threshold" ]; then
      echo "Disk usage is high"
  else
      echo "Disk usage is normal"
  fi
  ```

### 6. Logging with `tee`

* `tee` writes output to a file **and** displays it on screen.
* `-a` → append mode (keeps old logs).
* Example:

  ```bash
  echo "Disk usage alert" | tee -a /var/log/disk_usage.log
  ```

---

##  Final Script Example

```bash
#!/bin/bash

logfile="/var/log/disk_usage.log"
filesystem="/dev/mapper/rl_vbox-root"

# Extract usage percentage (remove % sign)
current_usage=$(df -Th | grep "$filesystem" | awk '{print $6}' | sed 's/%//')

threshold=80  # in percent

if [ "$current_usage" -gt "$threshold" ]; then
    echo "$(date): Disk usage is above threshold ($threshold%). Current usage: ${current_usage}%" | tee -a "$logfile"
else
    echo "$(date): Disk usage is under control. Current usage: ${current_usage}%" | tee -a "$logfile"
fi
```

---

## Summary

* Learned how to use `df -h` for disk usage.
* Extracted specific fields with `awk`.
* Cleaned symbols with `sed`.
* Used shell **variables** and **if conditions**.
* Logged output using `tee -a`.
---
