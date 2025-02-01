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
git clone https://github.com/YOUR-ORG/apostrophecms-mongodb-dev.git
cd apostrophecms-mongodb-dev
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

### **4️⃣ Stop MongoDB**
To stop MongoDB, run:
```sh
docker-compose down  # or podman-compose down
```

---

## **📂 What’s Inside?**
### **🔧 `docker-compose.yml`**
- Runs **MongoDB 6.0** in a container.
- Stores data in a **persistent volume** (`mongodb_data`).
- Uses `--bind_ip_all` to ensure **access from WSL/macOS/Linux**.

### **⚡ `start-mongo.sh`**
- Detects **Docker or Podman** and starts MongoDB.
- **For WSL2 users**, sets up **automatic port forwarding** to allow access from Windows applications.

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

## **🔄 Removing MongoDB**
If you want to **fully remove MongoDB and its data**, run:
```sh
docker-compose down -v
docker volume rm mongodb_data
```
or for Podman:
```sh
podman-compose down -v
podman volume rm mongodb_data
```

---

### **🌟 Contribute**
Feel free to submit issues or PRs to improve this setup! 🚀

---

## **Final Thoughts**
This README provides:
✅ **A simple, fast start**.  
✅ **Platform-specific instructions** for WSL2, macOS, and Linux.  
✅ **Troubleshooting steps** to help developers debug common issues.

Would you like any refinements? 🚀