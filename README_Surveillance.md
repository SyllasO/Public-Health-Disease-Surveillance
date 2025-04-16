
# Public Health Disease Surveillance Architecture

## Overview

This repository documents the step-by-step development of an end-to-end disease surveillance system architecture tailored for public health use cases. The project integrates simulated patient data, EHR platforms, and FHIR-based interoperability standards to enable real-time disease outbreak monitoring and reporting.

The system was designed using a modular approach, with each component building toward a robust, scalable, and secure digital health infrastructure.

---

## Project Architecture Breakdown

### 🧱 Architecture Development Part 1: Virtual Machine Configuration & Testing

- **Tools**: VirtualBox / VMware, Ubuntu 22.04 LTS
- **Purpose**: Provisioned and configured virtual machines to serve as isolated environments for OpenEMR, HAPI-FHIR, and database servers.
- **Outcome**: Stable VMs with secure remote access, networking, and test snapshots created for recovery.

---

### 🏥 Architecture Development Part 2: Installation, Configuration, and Security of OpenEMR

- **Tool**: [OpenEMR](https://www.open-emr.org/)
- **Purpose**: Installed and secured a production-grade Electronic Health Record (EHR) system to simulate a real hospital environment.
- **Security Features**: SSL enabled, user access control, MySQL hardening, and audit logging.
- **Outcome**: Fully functional OpenEMR instance with demo patient data for testing interoperability.

---

### 🧬 Architecture Development Part 3: Generation of Synthea Patient and Syndromic Surveillance Data

- **Tool**: [Synthea](https://github.com/synthetichealth/synthea)
- **Purpose**: Generated realistic synthetic patient records with custom modules for disease outbreak simulation (e.g., influenza, COVID-19).
- **Output Format**: FHIR (R4), CSV, JSON
- **Outcome**: Exported large-scale data sets for loading into HAPI-FHIR and OpenEMR.

---

### 📦 Architecture Development Part 4: Installation and Configuration of HAPI-FHIR Server

- **Tool**: [HAPI-FHIR JPA Server](https://hapifhir.io/)
- **Purpose**: Installed a FHIR-compliant backend for handling healthcare resources such as Conditions, Observations, and Encounters.
- **Security**: Configured with RESTful APIs, OAuth2-ready endpoints, and role-based access for data access.
- **Outcome**: Operational FHIR server ready to receive patient data from EHRs.

---

### 🔄 Architecture Development Part 5: Interoperability – FHIR Data Exchange with HAPI-FHIR

- **Tools**: Postman, Python, FHIR Client SDKs
- **Purpose**: Programmatically transmitted FHIR data (JSON/XML) from OpenEMR and Synthea into the HAPI-FHIR server.
- **Resources Handled**: Patient, Condition, Encounter, Observation
- **Outcome**: Verified bidirectional FHIR data exchange via REST API endpoints.

---

### 📊 Architecture Development Part 6: Aggregation and Visualization of Disease Outbreak Data

- **Tools**: Python (Pandas, Matplotlib, Seaborn), Power BI / Tableau (Optional)
- **Purpose**: Parsed FHIR resources and aggregated clinical indicators like disease incidence, onset trends, and demographics.
- **Outcome**: Visual dashboards showing real-time outbreak insights, enabling early warning for public health action.

---

## Key Technologies Used

- 🧰 **OpenEMR**
- 🧪 **Synthea**
- 🔁 **FHIR (HL7 R4)**
- 📦 **HAPI-FHIR Server**
- 🐧 **Linux (Ubuntu)**
- 📊 **Python / Pandas / Power BI**

---

## Getting Started

To replicate this architecture:

1. Clone this repo.
2. Follow the setup instructions in each part's directory (`part1/`, `part2/`, ..., `part6/`).
3. Use the synthetic data generated via Synthea and push it to the FHIR server.
4. Load and visualize the data for insights.

---

## Use Cases

- Disease outbreak simulation and training
- Interoperability and data exchange research
- Syndromic surveillance modeling
- Public health infrastructure prototyping

---

## License

This project is released under the [MIT License](LICENSE).
