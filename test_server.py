from mcstatus import JavaServer

SERVER_HOST = input("Server IP or hostname: ")
SERVER_PORT = 8888

try:
    server = JavaServer(SERVER_HOST, SERVER_PORT)
    status = server.status()

    print("Server is online!")
    print(f"Version: {status.version.name}")
    print(f"Players: {status.players.online}/{status.players.max}")
    print(f"Latency: {status.latency:.2f} ms")

except Exception as error:
    print(f"Server connection failed: {error}")
    raise SystemExit(1)