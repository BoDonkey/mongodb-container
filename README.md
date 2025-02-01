# **ApostropheCMS MongoDB Development Setup (WSL, macOS, Linux)**
This repository provides a **quick way to set up MongoDB** for ApostropheCMS development using **Docker or Podman**. It is optimized for **WSL2 on Windows** but works equally well on **Linux and macOS**.

## **🚀 Quick Start**
### **1️⃣ Install Prerequisites**
Make sure you have **Docker or Podman** installed:
- **WSL2 (Windows)**: Install [Docker Desktop](https://www.docker.com/products/docker-desktop) or [Podman](https://podman.io/getting-started/installation.html).
- **Mac/Linux**: Install Docker via:
  ```sh
  brew install docker  # macOS (via Homebrew)
  sudo apt install docker.io  # Debian/Ubuntu
  ```

### **2️⃣ Clone This Repository**
```sh
git clone https://github.com/BoDonkey/mongodb-container
cd mongodb-container
```

### **3️⃣ Start MongoDB**
Run the startup script:
```sh
./start-mongo.sh
```
- 🐳 **Automatically starts MongoDB using Docker or Podman**.
- ✅ **Handles port forwarding in WSL2 (Windows users)**.
- 🔄 **Restarts MongoDB if already running**.

MongoDB will be available at:
```
mongodb://localhost:27017
```

### **🛑 Stopping and Resetting MongoDB**
Once MongoDB is running, you may need to **stop** it or **reset the database** during development.

---

### **4️⃣ Stop MongoDB**
If you need to stop the MongoDB container **without deleting data**, run:
```sh
./scripts/stop.sh
```
This will:
- 🛑 **Stop the running MongoDB container**.
- ✅ Ensure MongoDB is **fully shut down** before exiting.
- ⚠️ **Does not delete stored data**, so restarting will resume from the last state.

To restart MongoDB after stopping it, run:
```sh
./scripts/start.sh
```

---

### **5️⃣ Reset the Database (⚠️ Deletes All Data)**
If you need a **fresh database** (e.g., to clear test data), run:
```sh
./scripts/reset-data.sh
```
This will:
- 🛑 **Stop MongoDB** (if running).
- ❌ **Delete all stored data** (including all databases and collections).
- 🔄 **Restart MongoDB with a clean slate**.

🚨 **Warning:** This action **cannot be undone**. If you reset the database, **all data will be permanently erased**.

---

### **🎯 When to Use Each Command**
| Command                 | Effect                                           | Data Kept? | When to Use |
|-------------------------|------------------------------------------------|------------|-------------|
| `./scripts/stop.sh`     | Stops MongoDB **without deleting data**        | ✅ Yes      | Temporarily stop the database |
| `./scripts/start.sh`    | Starts MongoDB (resumes from last state)       | ✅ Yes      | Restart MongoDB after stopping |
| `./scripts/reset-data.sh` | Deletes **all data** and restarts MongoDB      | ❌ No       | Start fresh with an empty database |

---

### **Need Help?**
To check if MongoDB is running, use:
```sh
docker ps | grep apostrophe-mongodb
```
or for Podman:
```sh
podman ps | grep apostrophe-mongodb
```

To view MongoDB logs:
```sh
docker logs apostrophe-mongodb
```
or
```sh
podman logs apostrophe-mongodb
```

---

## **📂 What’s Inside?**
### **🔧 `docker-compose.yml`**
- Runs **MongoDB 6.0** in a container.
- Stores data in a **persistent volume** (`mongodb_data`) to ensure data persists between restarts.
- Uses `--bind_ip_all` to ensure **access from WSL2, macOS, and Linux**.

### **⚡ `./scripts/start.sh`**
- Detects **Docker or Podman** and starts MongoDB.
- ✅ Ensures MongoDB is running before exiting.
- **For WSL2 users**, sets up **automatic port forwarding** to allow access from Windows applications.

### **🛑 `./scripts/stop.sh`**
- Stops the running MongoDB container **without deleting any data**.
- ✅ Ensures MongoDB is fully shut down.
- 💾 Data is preserved, allowing a restart with `./scripts/start.sh`.

### **⚠️ `./scripts/reset-data.sh`**
- Stops the MongoDB container.
- ❌ **Deletes all stored data** (resets the database).
- 🔄 Restarts MongoDB with a clean slate.

---

## **🛠 Troubleshooting**
### **Check if MongoDB is Running**
```sh
docker ps | grep apostrophe-mongodb
```
or
```sh
podman ps | grep apostrophe-mongodb
```

### **Check MongoDB Logs**
```sh
docker logs apostrophe-mongodb
```
or
```sh
podman logs apostrophe-mongodb
```

### **Fix: Cannot Connect to MongoDB in WSL2**
If you see **connection errors in Windows**, try:
```sh
netsh interface portproxy show v4tov4
```
If `27017` is missing, **rerun the startup script**.

---

## **🔥 Why Use This Setup?**
✔️ **No MongoDB Installation Required** – Just run the script!  
✔️ **Works on macOS, Linux, and WSL2** – Cross-platform compatibility.  
✔️ **Fast & Isolated** – No risk of conflicting system-wide MongoDB installations.  
✔️ **Persistent Data** – Stored safely in a Docker volume.  
✔️ **Optimized for ApostropheCMS** – Get started **instantly**!  

---

### **🌟 Contribute**
Feel free to submit issues or PRs to improve this setup! 🚀

---
