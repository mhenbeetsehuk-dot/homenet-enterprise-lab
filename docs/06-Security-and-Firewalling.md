\# Security and Firewalling



Security within the HOMENET lab is treated as a foundational design requirement rather than an afterthought. The environment reflects real enterprise security principles, where access control, service exposure, and traffic flow are deliberately constrained to reduce attack surface and limit blast radius in the event of a compromise.



The lab demonstrates how identity services, network controls, and host-level security mechanisms interact to enforce a layered security model.



---



\## Security Design Principles



The security architecture of the HOMENET lab is guided by the following principles:



\- \*\*Least privilege\*\* – Services and users are granted only the access required to perform their function.

\- \*\*Defense in depth\*\* – Multiple layers of security controls are applied across network, host, and service levels.

\- \*\*Explicit trust boundaries\*\* – Internal, management, and external traffic flows are clearly defined.

\- \*\*Service dependency awareness\*\* – Critical services such as DNS, Kerberos, and LDAP are protected due to their central role in authentication and authorization.

\- \*\*Fail-safe defaults\*\* – Misconfigurations result in service denial rather than unintended access.



---



\## Network-Level Firewalling



Firewalling is implemented to control traffic between network segments and to regulate access to critical infrastructure services.



\### Key Objectives



\- Restrict access to directory services

\- Prevent unnecessary lateral movement

\- Enforce controlled ingress and egress paths

\- Support troubleshooting by making dependencies explicit



\### Controlled Services



The following services are deliberately exposed only where required:



| Service | Port(s) | Purpose |

|------|-------|--------|

| DNS | 53 (TCP/UDP) | Name resolution and service discovery |

| Kerberos | 88 (TCP/UDP) | Authentication |

| LDAP / LDAPS | 389 / 636 | Directory access |

| SMB | 445 | Domain services and file access |

| RPC | 135 + dynamic range | AD-related operations |



Any deviation from these access requirements results in authentication failures or service disruption, reinforcing the importance of correct firewall configuration.



---



\## Host-Based Firewalling



Host-level firewalling is used to provide an additional control layer beyond network firewalls.



\### Objectives



\- Protect critical servers from unintended access

\- Limit exposure during misconfiguration scenarios

\- Provide local enforcement even if upstream controls fail



Host-based rules are designed to:

\- Allow only essential inbound services

\- Restrict management access to trusted subnets

\- Log denied traffic for troubleshooting and audit purposes



---



\## Identity-Aware Security



Because identity services are central to the lab, special emphasis is placed on protecting authentication mechanisms.



\### Key Considerations



\- \*\*Kerberos sensitivity to time and DNS\*\*  

&nbsp; Firewall rules must allow uninterrupted communication for ticket issuance and validation.

\- \*\*LDAP access restrictions\*\*  

&nbsp; Directory access is limited to authorised clients and services.

\- \*\*Administrative access segregation\*\*  

&nbsp; Elevated privileges are restricted to designated administrative accounts.



Authentication failures are intentionally triggered during testing to demonstrate how security controls directly impact service availability.



---



\## Security Misconfiguration Scenarios



The lab intentionally includes scenarios where security controls are misconfigured to replicate real operational issues, such as:



\- DNS traffic blocked, causing authentication failures

\- Kerberos ports restricted, preventing domain logons

\- SMB access denied, impacting policy processing and file services

\- Overly permissive firewall rules exposing unnecessary services



These scenarios reinforce the importance of understanding \*\*why\*\* specific ports and protocols are required rather than blindly opening access.



---



\## Operational Security Practices



Beyond firewalling, the lab incorporates operational security considerations, including:



\- Separation of administrative and standard user accounts

\- Validation of service dependencies before policy changes

\- Incremental rule deployment and testing

\- Use of logging to support incident investigation



Security changes are treated as controlled operational activities rather than ad-hoc adjustments.



---



\## Security as an Operational Discipline



The HOMENET lab demonstrates that security is not a static configuration but an ongoing operational discipline. Firewalling decisions directly affect authentication, authorization, and service availability, reinforcing the need for coordinated design, documentation, and validation.



By integrating security controls tightly with identity and networking services, the lab mirrors the complexity and interdependence found in modern enterprise environments.



