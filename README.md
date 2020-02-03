## Linux Settings
Paste the bellow code into the terminal and run it. 

```bash
wget --quiet -O setup-script.sh https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/script/setup-script.sh
chmod +x setup-script.sh
./setup-script.sh 2> Error-Log
```

## Arch Installation Script
Paste the bellow code into the terminal and run it. 

```bash
#Connect to Wifi
wifi-menu 
#After Connecting to WiFi
wget "https://raw.githubusercontent.com/0hasankamrul0/My-Default-Settings/master/script/arch_install_script"
bash arch_install_script
```

### LUKS Ex4
### Time Zone Set
### WriteCacheEnabled True
### Install Firewall and Configure it to enable SSH
### System snapshot (Backup)
### Docker
