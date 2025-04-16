
# Public Health Disease Surveillance Project - Code Summary

This document contains essential code snippets used across different parts of the surveillance architecture project.

---

## Part 1: Virtual Machine Setup (Shell Script)

```bash
# Update and upgrade VM packages
sudo apt update && sudo apt upgrade -y

# Install OpenSSH for remote access
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
```

---

## Part 2: OpenEMR Installation (Shell Script)

```bash
# Clone OpenEMR repo and run docker setup
git clone https://github.com/openemr/openemr.git
cd openemr
docker-compose up -d

# Set admin credentials in docker.env file
```

---

## Part 3: Synthea Patient Data Generation (Java & Command Line)

```bash
# Clone and run Synthea
git clone https://github.com/synthetichealth/synthea.git
cd synthea
./run_synthea -p 100 -m influenza_michigan -a 25-65

# Output FHIR data
ls output/fhir/
```

---

## Part 4: HAPI-FHIR Server Setup (Java/Spring)

```bash
# Docker run HAPI-FHIR server
docker run -d -p 8080:8080 hapiproject/hapi:v6.0.0

# Access server at: http://localhost:8080/fhir
```

---

## Part 5: FHIR Data Exchange (Python + requests)

```python
import requests
import json

# Sample POST to HAPI-FHIR
url = "http://localhost:8080/fhir/Patient"
headers = {"Content-Type": "application/fhir+json"}
with open("synthea_patient.json") as f:
    data = json.load(f)
r = requests.post(url, headers=headers, json=data)
print(r.status_code, r.json())
```

---

## Part 6: Aggregation & Visualization (Python)

```python
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_json("fhir_output.json")
df['condition'] = df['entry'].apply(lambda x: x['resource']['code']['text'])

# Plot disease trends
df['condition'].value_counts().plot(kind='bar', title='Disease Incidence')
plt.xlabel('Condition')
plt.ylabel('Count')
plt.tight_layout()
plt.show()
```

---

## Notes

- Additional configuration scripts are available for secure database setup, FHIR client integration, and dashboard development.
- Consider using `pandas` for CSV parsing, `Seaborn` for statistical plots, and `FHIR client libraries` for advanced integrations.

