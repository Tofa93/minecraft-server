# Minecraft Docker Server

A self-built Dockerized Minecraft Java Edition server based on Eclipse Temurin and Alpine Linux, featuring configurable environment variables, persistent storage, and automatic container recovery.

## Table of Contents

- [Features](#features)
- [Repository Structure](#repository-structure)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Testing](#testing)
- [Security](#security)

## Features

- Minecraft Java Edition 26.3
- Java 25 Runtime
- Custom Alpine-based Docker image
- Automatic server download and checksum verification
- Configurable server settings
- Persistent world and configuration data
- Automatic restart on failure
- Interactive server console
- Python-based server status check

## Repository Structure

| File | Description |
|---|---|
| `docs/checklist.md` | Contains the project requirements and verification checklist. |
| `Dockerfile` | Builds the custom Minecraft server image. |
| `docker-compose.yaml` | Defines the service, networking, storage, and restart policy. |
| `entrypoint.sh` | Initializes the configuration and starts the server. |
| `.env.example` | Provides default configuration values. |
| `.gitignore` | Excludes local configuration and generated files. |
| `test_server.py` | Checks server availability using mcstatus. |
| `README.md` | Provides project documentation. |

## Quickstart

### Prerequisites

- Git
- Docker
- Docker Compose

### Installation

Clone the repository:

```bash
git clone https://github.com/tofa93/minecraft-server.git
cd minecraft-server
```

Create the environment configuration:

```bash
cp .env.example .env
```

On Windows PowerShell:

```powershell
Copy-Item .env.example .env
```

Read the [Minecraft EULA](https://www.minecraft.net/en-us/eula) and set `EULA=true` in the `.env` file if you agree.

Build and start the server:

```bash
docker compose up -d --build
```

Connect using Minecraft Java Edition:

```text
SERVER_IP:8888
```

## Usage

### Environment Variables

Modify the `.env` file to customize the server.

| Variable | Default | Description |
|---|---|---|
| `EULA` | `false` | Minecraft EULA acceptance |
| `MEMORY_MIN` | `1G` | Initial Java heap size |
| `MEMORY_MAX` | `2G` | Maximum Java heap size |
| `GAMEMODE` | `survival` | Default game mode |
| `DIFFICULTY` | `normal` | Game difficulty |
| `MAX_PLAYERS` | `20` | Maximum player count |
| `MOTD` | `Minecraft Docker Server` | Server description |

Game settings are applied when `server.properties` is first created. Existing configuration files are preserved.

Recreate the container to apply changes to runtime environment variables:

```bash
docker compose up -d
```

### Networking

The Minecraft server uses TCP port `25565` internally and is exposed through port `8888` on the host.

Ensure that TCP port `8888` is accessible through the cloud provider's firewall.

### Server Management

Check the container status:

```bash
docker compose ps
```

View server logs:

```bash
docker compose logs -f mc-server
```

Open the interactive server console:

```bash
docker attach mc-server
```

Enable the whitelist and add a player:

```text
whitelist on
whitelist add PLAYER_NAME
```

Detach from the console using `Ctrl + P` followed by `Ctrl + Q`.

Stop and remove the container:

```bash
docker compose down
```

### Persistent Storage

The Docker volume `mc-data` stores the Minecraft world, player data, and server configuration.

Data is preserved when the container is stopped, restarted, or recreated.

**Warning:** Using `docker compose down -v` deletes the persistent volume.

### Restart Policy

The service uses `restart: on-failure` to automatically restart the container when its main process exits with a non-zero exit code.

## Testing

### Minecraft Client

Connect to the server using Minecraft Java Edition 26.3 and port `8888`.

### Python Status Check

Python and mcstatus are required for this optional testing method.

Install the dependency:

```bash
python -m pip install mcstatus
```

Run the test script:

```bash
python test_server.py
```

Enter the server IP address or hostname when prompted.

The script displays the server version, player count, and connection latency.

### Verification Results

- Server image builds successfully.
- Local Minecraft connection works.
- Cloud VM connection through port 8888 works.
- Python status check works.
- World and configuration data persist after container recreation.
- The container automatically restarts after a process failure.

## Security

- The Minecraft server runs as a non-root user.
- The server binary is downloaded from Mojang and verified using its SHA-1 checksum.
- Local environment files are excluded from version control.
- Credentials and IP addresses are not stored in the repository.
- Minecraft online authentication remains enabled.
- Whitelist access is recommended for publicly accessible servers.