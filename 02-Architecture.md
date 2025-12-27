\# HOMENET Lab – Architecture



This document describes the logical and physical architecture of the HOMENET lab environment, outlining how core infrastructure components are structured, how they interact, and the rationale behind key architectural decisions.



The architecture is intentionally designed to resemble a small-to-medium enterprise network, prioritising clarity, realism, and operational relevance over unnecessary complexity.



\## Architectural Overview



The HOMENET lab follows a \*\*centralised identity and services model\*\*, with clear separation between infrastructure services and client systems. Core services are hosted on dedicated servers, while clients consume those services in a controlled and predictable manner.



At a high level, the architecture consists of:

\- A centralized identity and authentication platform

\- Internal DNS services tightly coupled with identity

\- Segmented networking with defined trust boundaries

\- Client systems joined to and managed by the domain



This structure enables realistic testing of authentication flows, name resolution dependencies, and service availability under both normal and failure conditions.



\## Core Components



\### Identity Services



At the heart of the environment is a centralized directory service providing:

\- Authentication

\- Authorization

\- User and group management

\- Kerberos ticketing

\- LDAP directory services



All domain-aware systems rely on this service for identity resolution and access control, reflecting real-world enterprise dependency on centralized identity platforms.



\### DNS Services



DNS is a foundational dependency within the lab architecture. Internal name resolution is required for:

\- Domain controller discovery

\- Kerberos authentication

\- Service location (SRV records)

\- Client-to-service communication



DNS is intentionally treated as a \*\*critical dependency\*\*, allowing scenarios where authentication and access fail due to DNS misconfiguration or unavailability.



\### Network Design



The network architecture is built around a single internal address space, with logical segmentation enforced through configuration rather than physical isolation. This allows the lab to focus on service behaviour and troubleshooting rather than hardware complexity.



Key characteristics include:

\- Static addressing for infrastructure services

\- Predictable gateway and routing behaviour

\- Controlled DNS resolution paths

\- Firewall rules that reflect enterprise security boundaries



\### Client Systems



Client systems are domain-joined and consume centralized services rather than operating independently. This ensures:

\- Authentication is domain-controlled

\- Access is policy-driven

\- Name resolution relies on internal DNS

\- Troubleshooting mirrors real enterprise support scenarios



Clients are treated as first-class participants in the architecture, not isolated test machines.



\## Service Interdependencies



A key architectural goal of the HOMENET lab is to expose \*\*service interdependencies\*\*, including:

\- DNS as a prerequisite for authentication

\- Kerberos reliance on time synchronisation and name resolution

\- Authentication dependency for file access and service usage

\- Network reachability as a prerequisite for all higher-level services



The architecture intentionally allows these dependencies to be stressed, broken, and repaired to reinforce operational understanding.



\## Design Decisions and Rationale



Several deliberate design choices were made:

\- \*\*Centralised identity\*\* to reflect enterprise norms

\- \*\*Internal DNS ownership\*\* to expose resolution failures

\- \*\*Minimal but realistic network segmentation\*\*

\- \*\*No reliance on automated provisioning tools\*\*

\- \*\*Manual configuration to reinforce understanding\*\*



These decisions ensure the lab remains educational, transparent, and representative of real operational environments.



\## Architectural Boundaries



The lab is designed to scale logically rather than physically. Additional services, systems, or segments can be introduced without restructuring the core design, supporting future expansion such as:

\- Additional domain controllers

\- Member servers

\- File and application services

\- Security monitoring and logging components



---



This architecture document provides the structural context for subsequent sections covering network design, identity services, DNS behaviour, and troubleshooting scenarios.



