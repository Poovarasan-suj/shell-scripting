#  Day-01: Reading Environment Variables in Shell Script

## 1. What is an Environment Variable?

* An **environment variable** is like a storage box inside your shell.
* It contains useful system information (like your username, home directory, shell).
* Examples: `USER`, `HOME`, `SHELL`, `PATH`.

👉 Check values directly in the terminal:

```bash
echo $USER
echo $HOME
echo $SHELL
```

---

## 2. Writing Your First Script

**File:** `env.sh`

```bash
#!/bin/bash
# Script to read and print environment variables

echo "My hostname is: $HOSTNAME"
echo "My current user logging on is : $USER"
echo "My current shell type is : $SHELL"
echo "My Name is : $MY_NAME"
```

### Run the script

```bash
chmod +x env.sh
./env.sh
```

### Example Output:

```
My hostname is: controlnode
My current user logging on is : sujith
My current shell type is : /bin/bash
My Name is : Poovarasan
```

---

## 3. Custom Environment Variables

You can create your own variable using `export`:

```bash
export MY_NAME="Poovarasan"
export FAV_COLOR="Blue"
```

Now check them:

```bash
echo $MY_NAME
echo $FAV_COLOR
```

---

## 4. Making Custom Variables Permanent

If you want your variable to stay available every time you log in:

1. Open `~/.bashrc` file

   ```bash
   nano ~/.bashrc
   ```

2. Add your exports at the end:

   ```bash
   export MY_NAME="Poovarasan"
   export FAV_COLOR="Blue"
   export MY_ROLE="Cloud Engineer"
   ```

3. Reload the file:

   ```bash
   source ~/.bashrc
   ```

Now every terminal session will have these variables.



