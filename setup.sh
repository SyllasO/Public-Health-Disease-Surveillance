
#!/bin/bash

echo "=== Public Health Disease Surveillance Setup Script ==="
echo "Target OS: Ubuntu Linux"
echo "--------------------------------------"

# Update system
echo "[1/7] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install common tools
echo "[2/7] Installing common utilities..."
sudo apt install -y git curl wget unzip openjdk-11-jdk docker.io docker-compose openssh-server

# Enable and start SSH
echo "[3/7] Configuring SSH service..."
sudo systemctl enable ssh
sudo systemctl start ssh

# Install OpenEMR (Docker-based)
echo "[4/7] Cloning and setting up OpenEMR..."
git clone https://github.com/openemr/openemr.git ~/openemr
cd ~/openemr
docker-compose up -d
cd ~

# Install and build Synthea
echo "[5/7] Cloning and building Synthea..."
git clone https://github.com/synthetichealth/synthea.git ~/synthea
cd ~/synthea
./gradlew build check test
cd ~

# Run sample Synthea patient generation
echo "[6/7] Generating synthetic patient data..."
cd ~/synthea
./run_synthea -p 50 -m influenza_michigan -a 25-65
cd ~

# Run HAPI-FHIR Server
echo "[7/7] Starting HAPI-FHIR Server (Docker)..."
docker run -d --name hapi-fhir -p 8080:8080 hapiproject/hapi:v6.0.0

echo "--------------------------------------"
echo "Setup complete! Access OpenEMR and HAPI-FHIR at:"
echo "- OpenEMR Docker service on port 80 or 443"
echo "- HAPI-FHIR server at http://localhost:8080/fhir"
