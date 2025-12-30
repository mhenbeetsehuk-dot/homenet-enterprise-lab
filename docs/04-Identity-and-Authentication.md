\# Identity and Authentication



This section documents the identity and authentication design of the HOMENET lab environment. Centralised identity is a foundational component of enterprise infrastructure, enabling consistent access control, authentication, and policy enforcement across systems and services.



The lab implements a directory-centric identity model to reflect how authentication and authorisation are handled in real-world enterprise networks.



---



\## Identity Architecture Overview



The HOMENET lab uses a central directory service to provide:



\- A single source of truth for user and group identities

\- Centralised authentication for domain-joined systems

\- Consistent authorisation through group-based access control

\- Secure, ticket-based authentication mechanisms



All identity-aware systems within the environment are designed to depend on this directory service, ensuring realistic service interdependencies and failure scenarios.



---



\## Active Directory–Compatible Identity Services



The environment implements an Active Directory–compatible domain controller to provide enterprise identity services without reliance on proprietary operating systems.



The domain controller is responsible for:



\- User and group account management

\- Authentication services

\- Directory services (LDAP)

\- Kerberos ticket issuance

\- DNS integration for service discovery



This design mirrors common enterprise deployments where Linux systems participate fully in directory-based authentication ecosystems.



---



\## Kerberos Authentication Model



Authentication within the HOMENET lab is built around Kerberos, which provides secure, ticket-based authentication rather than password transmission.



Key characteristics of the Kerberos model in this environment include:



\- Mutual authentication between clients and services

\- Time-sensitive ticket granting

\- Dependency on accurate DNS resolution

\- Strong coupling between identity, DNS, and system time



This design allows the lab to demonstrate common Kerberos failure modes, such as clock skew, DNS misconfiguration, and service principal mismatches.



---



\## DNS Dependency and Service Discovery



Identity and authentication services in the lab are tightly integrated with DNS.



DNS is used for:



\- Locating directory and authentication services

\- Advertising LDAP and Kerberos service records

\- Resolving domain controllers and service endpoints



Authentication failures caused by DNS misconfiguration are intentionally reproducible in the lab to reinforce the importance of DNS as a critical dependency rather than a supporting service.



---



\## User and Group Management



The identity model is group-centric, reflecting enterprise best practices.



Users are:



\- Created and managed centrally

\- Assigned to security groups

\- Granted access to resources based on group membership rather than individual permissions



This approach enables scalable access control and simplifies administration as the environment grows.



---



\## Linux System Integration



Linux systems within the HOMENET environment are designed to integrate directly with the central directory service.



This integration enables:



\- Domain-based authentication for Linux hosts

\- Centralised identity management across heterogeneous systems

\- Consistent permission models between Linux and Windows systems

\- Reduced reliance on local user accounts



The lab intentionally highlights the configuration complexity involved in directory integration, including name service resolution, authentication stacks, and permission mapping.



---



\## Security Considerations



The identity and authentication design reflects several enterprise security principles:



\- Centralised authentication reduces credential sprawl

\- Ticket-based authentication limits password exposure

\- Group-based access control enforces least privilege

\- Service dependencies encourage defensive configuration and validation



Misconfigurations are treated as learning opportunities, reinforcing the need for careful design, documentation, and monitoring.



---



\## Operational Behaviour and Failure Modes



The HOMENET lab explicitly supports testing and observation of authentication-related failures, including:



\- Kerberos authentication failures due to time drift

\- DNS resolution issues affecting login and service access

\- Incorrect group membership impacting authorisation

\- Service startup failures caused by unavailable identity services



These scenarios reinforce real-world operational troubleshooting skills rather than idealised deployments.



---



\## Summary



Identity and authentication within the HOMENET lab are designed to reflect the complexity, dependencies, and security considerations of modern enterprise environments. By centralising identity and enforcing directory-based authentication, the lab provides a realistic platform for understanding how authentication systems behave under both normal and failure conditions.



