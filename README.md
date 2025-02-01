# MongoDB Container Setup for ApostropheCMS

A simple container setup for MongoDB that works with both Docker and Podman, designed for ApostropheCMS 4.x development.

## Quick Start

```bash
git clone https://github.com/your-username/apostrophe-mongodb-dev
cd apostrophe-mongodb-dev

chmod +x scripts/*.sh  # Make scripts executable

./scripts/start.sh
```

That's it! The script will automatically detect whether you're using Docker or Podman and start MongoDB on the default port 27017, ready for ApostropheCMS development.

## Using the Helper Scripts

Three scripts are provided to make managing your MongoDB container easier:

1. `./scripts/start.sh` - Starts the MongoDB container
   ```bash
   ./scripts/start.sh
   ```

2. `./scripts/stop.sh` - Gracefully stops the MongoDB container
   ```bash
   ./scripts/stop.sh
   ```

3. `./scripts/reset-data.sh` - Removes all data and restarts with a fresh MongoDB instance
   ```bash
   ./scripts/reset-data.sh
   ```
   Warning: This will delete all your MongoDB data and start fresh. Use this when you want to completely reset your development database.

## Prerequisites

### Linux/macOS
- Either Docker or Podman installed on your system
- Git (for cloning the repository)

### Windows with WSL2
- Windows Subsystem for Linux 2 (WSL2) installed
- Docker Desktop with WSL2 backend OR Podman installed in WSL2
- Git (can be installed in Windows or WSL)

#### Windows Setup Notes
1. Ensure WSL2 is your default WSL version:
   ```powershell
   wsl --set-default-version 2
   ```

2. If using Docker Desktop:
   - Enable WSL2 backend in Docker Desktop settings
   - Enable your WSL distro integration in Docker Desktop > Settings > Resources > WSL Integration

3. If using Podman in WSL2:
   - Install Podman inside your WSL distro:
     ```bash
     sudo apt-get update
     sudo apt-get install podman
     ```

## Usage with ApostropheCMS

1. Start the MongoDB container using the scripts provided
2. Create your ApostropheCMS project as normal
3. Run your ApostropheCMS project - it will automatically connect to MongoDB on the default port

No additional configuration is needed in your ApostropheCMS project - it will work out of the box.

## Troubleshooting

1. Windows/WSL2 Specific Issues:
   - If MongoDB isn't accessible from Windows:
     ```powershell
     # Check if the port is being forwarded properly
     netsh interface portproxy show all
     # If needed, add port forwarding:
     netsh interface portproxy add v4tov4 listenport=27017 connectaddress=localhost connectport=27017
     ```
   - If you get "permission denied" in WSL:
     ```bash
     # Inside WSL
     sudo chmod 666 /var/run/docker.sock
     ```
   - If the container won't start in WSL Podman:
     ```bash
     podman machine init
     podman machine start
     ```

2. Port conflicts:
   - Edit `compose.yaml` and change `27017:27017` to use a different port, e.g., `27018:27017`
   - Note: If you change the port, you'll need to update your ApostropheCMS configuration to match

## Making Changes

1. Fork the repository
2. Make your changes
3. Submit a pull request

## License

MIT License - feel free to use and modify for your needs.