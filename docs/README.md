# \# HOMENET Lab

# 

# HOMENET is an enterprise-style infrastructure lab designed to simulate how centralized identity, networking, and security services are architected, deployed, and operated in a production environment.

# 

# The environment was built from the ground up to develop practical operational understanding of service dependencies (DNS, Kerberos, authentication), configuration management, and troubleshooting of real failure modes.

# 

# \## What This Lab Demonstrates

# 

# \- Enterprise identity services using Samba Active Directory Domain Services (AD DS)

# \- DNS dependency and name resolution behaviour in identity-centric environments

# \- Kerberos authentication flows and service discovery patterns

# \- Network design discipline (static addressing, predictable routing, deterministic infrastructure)

# \- Operational troubleshooting and structured diagnostic practice

# \- Documentation-first engineering and repeatable configuration management

# 

# \## Repository Structure

# 

# \- `docs/`  

# &nbsp; Project documentation, architecture, design decisions, and lessons learned.

# 

# \- `configs/`  

# &nbsp; Sanitised configuration references used in the lab (e.g., Netplan, Samba).

# 

# \- `scripts/`  

# &nbsp; Validation and health-check scripts to support operational verification and CI checks.

# 

# \- `evidence/`  

# &nbsp; Command outputs, screenshots, and proof of working state (optional but recommended).

# 

# \- `.github/workflows/`  

# &nbsp; CI workflow definitions (prepared locally; activated once committed to GitHub).

# 

# \## Documentation Index

# 

# \- `docs/01-Overview.md`  

# \- `docs/02-Architecture.md`  

# \- `docs/03-Network-Design.md`  

# \- `docs/04-Identity-and-Authentication.md`  

# \- `docs/05-DNS-and-Name-Resolution.md`  

# \- `docs/06-Security-and-Firewalling.md`  

# \- `docs/07-Troubleshooting-Scenarios.md`  

# \- `docs/08-Lessons-Learned.md`

# 

# \## Environment Summary

# 

# Record the lab’s current state here (populate from your environment extraction output):

# 

# \- \*\*OS Version:\*\*  No LSB modules are available.

# Distributor ID: Ubuntu

# Description:    Ubuntu 20.04.6 LTS

# Release:        20.04

# Codename:       focal

# \- \*\*IP Address(es):\*\*    inet 192.168.10.10/24 brd 192.168.10.255 scope global ens33 

# \- \*\*Hostnames:\*\*  dc1

# \- \*\*Domain / Realm:\*\*          default\_realm = HOMENET.COM

# &nbsp;       dns\_lookup\_realm = false

# \[realms]

# \[domain\_realm]

# \- \*\*DNS Backend:\*\*  lrwxrwxrwx 1 root root 39  /etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

# \- \*\*Date Completed:\*\*  Sat 27 Dec 2025 12:21:25 PM UTC

# 

# \## Notes on Security

# 

# This repository intentionally excludes runtime databases and secret material (e.g., `.ldb`, `.tdb`, `secrets.ldb`, private keys). Only sanitised reference configurations are stored.

# 

# \## Next Enhancements

# 

# \- CI validation for documentation and configuration changes (GitHub Actions)

# \- Controlled CD workflow (manual approval) for applying selected infrastructure changes

# \- Expanded evidence pack for audit-ready verification

# 

