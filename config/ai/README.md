# Local AI setup

This document covers the optional local AI layer for Windots. The main flow that will be used is an combination of Ollama and Odysseus.

In case there are performance issues or installation issues check [troubleshooting](troubleshooting.md) guide

## PrivateGPT

PrivateGPT is another optional local AI path if you want a more document-focused private knowledge workflow.

Project links:

- [PrivateGPT GitHub](https://github.com/imartinez/privateGPT)
- [PrivateGPT website](https://www.privategpt.io/)

## Useful references

- [Anthropic](https://www.anthropic.com/research/AI-assistance-coding-skills) research on AI assistance and coding skills 
- [Cortex](https://www.cortex.io/report/engineering-in-the-age-of-ai-2026-benchmark-report) 2026 benchmark report

## Odysseus + Ollama

- [Odysseus](https://pewdiepie-archdaemon.github.io/odysseus/)

**Docker inside WSL + Odysseus in Docker + Ollama running natively in WSL bound to `0.0.0.0:11434`.**

**Critical requirement:**

Odysseus containers cannot reliably reach Ollama unless Ollama is started with:

```bash
OLLAMA_HOST=0.0.0.0:11434 ollama serve
```

Using the default localhost binding often causes connection failures from Docker containers.

#### Flow Launcher with Odysseus

1. Make sure Odysseus is discoverable from the Start Menu or as an installed application
2. Open Flow Launcher
3. Search for `Odysseus`
4. If needed, pin it through your preferred launcher workflow or give it a custom shortcut keyword

#### GlazeWM shortcut for Odysseus

After installation, add a launcher command in [config/glazewm/config.yaml](../glazewm/config.yaml).

Prefer one of these styles:

```yaml
- commands: ["shell-exec odysseus"]
	bindings: ["alt+ctrl+y"]
```

If Odysseus is not on `PATH`, use a shortcut or full executable path only on your local machine, not as the shared repo default.

### Setup Odysseus + Ollama

<details>
	
<summary>🪟 <b>Docker</b></summary>

#### 1. Install Docker Engine Inside WSL

Update:

```bash
sudo apt update
sudo apt upgrade -y
```

Install prerequisites:

```bash
sudo apt install -y ca-certificates curl gnupg lsb-release
```

Add Docker repository:

```bash
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install Docker:

```bash
sudo apt update

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin
```

#### 2. Start Docker

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Verify:

```bash
docker run hello-world
```

---

#### 3. Fix Docker Permissions

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Test:

```bash
docker ps
```

No sudo should be required.

---

<br>

</details>

<details>
	
<summary>🪟 <b>Ollama</b></summary>

#### 4. Install Ollama

Install:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Verify:

```bash
ollama -v
```

---

#### 5. Configure Ollama Correctly

This is the most important part.

Add to your shell profile:

```bash
nano ~/.bashrc
```

Append:

```bash
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_BASE_URL=http://localhost:11434
```

Reload:

```bash
source ~/.bashrc
```

Verify:

```bash
echo $OLLAMA_HOST
```

Expected:

```text
0.0.0.0:11434
```

---

#### 6. Start Ollama

Start manually:

```bash
OLLAMA_HOST=0.0.0.0:11434 ollama serve
```

Open a second WSL terminal and test:

```bash
curl http://localhost:11434/api/tags
```

Expected:

```json
{"models":[]}
```

or a list of installed models.

If this works, Docker containers will be able to reach Ollama.

---

#### 7. Configure Automatic Ollama Startup

Edit:

```bash
nano ~/.bashrc
```

Add:

```bash
# Start Ollama automatically
if ! pgrep -f "ollama serve" > /dev/null; then
    export OLLAMA_HOST=0.0.0.0:11434
    nohup ollama serve > ~/.ollama.log 2>&1 &
fi
```

Apply:

```bash
source ~/.bashrc
```

Verify:

```bash
ps aux | grep ollama
```

---

<br>

</details>

<details>
	
<summary>🪟 <b>AI Models</b></summary>

#### 8. Install Ollama models
Examples:

```bash
ollama pull llama3
```
```bash
ollama pull mistral
```
```bash
ollama pull qwen3:8b
```
```bash
ollama pull gemma3:12b
```
```bash
ollama pull qwen3-coder:30b
```
To pull and run it immediatly:
```bash
ollama run qwen2.5-coder:14b "hello"
```
---

<br>

</details>

<details>

<summary>🪟 <b>Odysseus</b></summary>

#### 9. Install Odysseus

Clone repository:

```bash
mkdir projects
cd projects
git clone https://github.com/pewdiepie-archdaemon/odysseus.git
cd odysseus
```

Create environment file:

```bash
cp .env.example .env
```
---

#### 10. Start Odysseus

From the Odysseus directory:

```bash
docker compose up -d --build
```

Check status:

```bash
docker compose ps
```
Expected output: 

| Container Name       | Image                                 | Service    | Status                      | Port Mapping                |
| --------------------- | ------------------------------------- | ---------- | --------------------------- | --------------------------- |
| `odysseus-chromadb-1` | `chromadb/chroma:latest`              | `chromadb` | Up 24 seconds               | `127.0.0.1:8100 → 8000/tcp` |
| `odysseus-ntfy-1`     | `binwiederhier/ntfy`                  | `ntfy`     | Up 24 seconds               | `127.0.0.1:8091 → 80/tcp`   |
| `odysseus-odysseus-1` | `odysseus-odysseus`                   | `odysseus` | Up 18 seconds               | `127.0.0.1:7000 → 7000/tcp` |
| `odysseus-searxng-1`  | `searxng/searxng:2026.5.31-7159b8aed` | `searxng`  | Up 24 seconds (**healthy**) | `127.0.0.1:8080 → 8080/tcp` |

#### 11. Get the Initial Admin Password

On first startup an admin account/password is generated and printed in the logs.

Find it with:

```bash
docker compose logs --tail=100 odysseus
```

You may see something like:

```text
[ok] Initial admin user created (admin)
        Temporary password: xxx
** Change it after first login. Set ODYSSEUS_ADMIN_PASSWORD to choose your own. **

```

Login with:

```text
Username: admin
Password: <temporary password>
```

Immediately change the password.

For permanent credentials set:

```env
ODYSSEUS_ADMIN_USERNAME=admin
ODYSSEUS_ADMIN_PASSWORD=yourpassword
```

in your `.env`.

View logs for troubleshooting

```bash
docker compose logs -f
```

Open in browser:

```text
http://localhost:7000
```

---

<br>

</details>

<details>

<summary>🪟 <b>Odysseus + Ollama</b></summary>

#### 12. Configure Odysseus to Use Ollama

Odysseus must point to the Ollama server.

Use:

```text
http://localhost:11434
```

```text
http://host.docker.internal:11434
```

or the WSL gateway IP if required by the Odysseus version you're running.

Do **not** use:

```text
http://0.0.0.0:11434
```

`0.0.0.0` is a bind address, not a client connection address.

For testing:

```bash
docker exec -it odysseus-odysseus-1 sh
curl http://host.docker.internal:11434/api/tags
exit
```

from inside the Odysseus container.

If it returns model data, networking is correct.

---

<br>

</details>

<details>

<summary>🪟 <b>VS code and Ollama</b></summary>

#### 13. Connect VS Code to Ollama

In VS Code:

1. Open the **Command Palette** (`Ctrl+Shift+P`).
2. Run: Copilot: Manage Models
3. Click: **Add Models → Ollama**

VS Code should automatically detect your locally available Ollama models.

<br>

</details>

<details>

<summary>🪟 <b>Verification</b></summary>

### Docker

```bash
docker ps
```

Works.

### Ollama

```bash
curl http://localhost:11434/api/tags
```

Returns JSON.

### Model

```bash
ollama run llama3 "test"
```

Responds.

### Listening Address

```bash
ss -tulpn | grep 11434
```

Should show:

```text
0.0.0.0:11434
```

### Odysseus

```bash
docker compose ps
```

Shows healthy containers.

---

<br>

</details>