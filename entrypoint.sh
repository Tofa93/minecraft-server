#!/bin/sh

set -e

# Default configuration
MEMORY_MIN="${MEMORY_MIN:-1G}"
MEMORY_MAX="${MEMORY_MAX:-2G}"
EULA="${EULA:-false}"
GAMEMODE="${GAMEMODE:-survival}"
DIFFICULTY="${DIFFICULTY:-normal}"
MAX_PLAYERS="${MAX_PLAYERS:-20}"
MOTD="${MOTD:-Minecraft Docker Server}"

# Check EULA acceptance
if [ "${EULA}" != "true" ]; then
    echo "You must accept the Minecraft EULA."
    exit 1
fi

echo "eula=true" > eula.txt

# Create server configuration if it does not exist
if [ ! -f server.properties ]; then
    echo "Creating server configuration..."

    cat > server.properties <<EOF
server-port=25565
gamemode=${GAMEMODE}
difficulty=${DIFFICULTY}
max-players=${MAX_PLAYERS}
motd=${MOTD}
online-mode=true
EOF
fi

# Start Minecraft server
echo "Starting Minecraft server..."

exec java \
    -Xms"${MEMORY_MIN}" \
    -Xmx"${MEMORY_MAX}" \
    -jar /opt/minecraft/server.jar \
    nogui