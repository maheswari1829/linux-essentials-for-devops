# SSH Keys Setup

## Generate SSH Key
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# Start SSH Agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
##Copy Public Key to Server
```bash
ssh-copy-id user@server_ip
#Test Login
```bash
ssh user@server_ip

