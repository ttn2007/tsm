#!/bin/bash

TORRC_FILE="/etc/tor/torrc"
BACKUP_FILE="/etc/tor/torrc.backup"

start_tor() {
    echo "[+] Installing Tor and Snowflake client..."
    sudo apt update
    sudo apt install -y tor snowflake-client

    echo "[+] Backing up torrc..."
    if [ ! -f "$BACKUP_FILE" ]; then
        sudo cp $TORRC_FILE $BACKUP_FILE
    fi

    echo "[+] Configuring Snowflake in torrc..."
    sudo bash -c "cat > $TORRC_FILE <<EOF
UseBridges 1
ClientTransportPlugin snowflake exec /usr/bin/snowflake-client
Bridge snowflake 0.0.3.0:1
SocksPort 9050
EOF"

    echo "[+] Starting Tor service..."
    sudo service tor restart || sudo systemctl restart tor
    echo "[+] Tor with Snowflake is now running on port 9050."
}

stop_tor() {
    echo "[+] Stopping Tor and restoring configuration..."
    if [ -f "$BACKUP_FILE" ]; then
        sudo cp $BACKUP_FILE $TORRC_FILE
        sudo service tor stop || sudo systemctl stop tor
        echo "[+] Configuration restored to original state."
    else
        echo "[!] Backup file not found, cannot restore."
    fi
}

status_tor() {
    echo "[+] Checking Tor service status..."
    if systemctl is-active --quiet tor || service tor status >/dev/null 2>&1; then
        echo "[✓] Tor is running."
        echo "[+] Checking IP via Tor..."
        torsocks curl -s https://check.torproject.org/api/ip || echo "[!] Could not retrieve Tor IP."
    else
        echo "[✗] Tor is not active."
    fi
}

case "$1" in
    start)
        start_tor
        ;;
    stop)
        stop_tor
        ;;
    status)
        status_tor
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        ;;
esac