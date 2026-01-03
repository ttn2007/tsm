# Tor Snowflake Manager — Bash Utility

🎯 **Tor Snowflake Manager** is a lightweight Bash-based utility that allows you to easily start, stop, and check the status of the Tor service with the **Snowflake** pluggable transport. Designed for Linux environments such as **WSL**, it enables Tor to act as a system-wide proxy.

---

## 🚀 Features

✅ Install Tor and Snowflake prerequisites  
✅ Automatically configure Tor with Snowflake  
✅ Start Tor with Snowflake bridges  
✅ Stop Tor and restore original configuration  
✅ Check Tor service status and display current Tor IP  
✅ Simple CLI interface with `start | stop | status` options  

---

## 📦 Installation

1️⃣ Clone or copy the script:  
```bash
git clone https://github.com/yourusername/tor-snowflake-manager
```

2️⃣ Make the script executable:  
```bash
chmod +x ~/tor-snowflake-manager/tor-snowflake.sh
```

3️⃣ (Optional) Add an alias to `.bashrc` or `.zshrc` for quick access:  
```bash
echo 'alias tsm="bash ~/tor-snowflake-manager/tor-snowflake.sh"' >> ~/.bashrc
source ~/.bashrc
```

Now you can simply type:  
```bash
tsm start
```

---

## 🧰 Usage

Run the script:  
```bash
bash ~/tor-snowflake-manager/tor-snowflake.sh <option>
```

Options:  
```text
start   → Start Tor with Snowflake
stop    → Stop Tor and restore configuration
status  → Check Tor service status and show Tor IP
```

---

## 📄 Dependencies

✅ Bash (default in Linux/WSL)  
✅ Required packages:  
```bash
sudo apt update && sudo apt install -y tor snowflake-client torsocks curl
```

---

## 🙌 Author

Made with ❤️ by ttn2007
