\# Troubleshooting Scenarios



This section documents common failure scenarios encountered within the HOMENET lab environment and the structured approach used to diagnose and resolve them. The scenarios are representative of real-world enterprise incidents where multiple infrastructure services are interdependent, and symptoms may not immediately indicate root cause.



The emphasis is placed on \*\*problem isolation, dependency analysis, and corrective action\*\*, rather than trial-and-error configuration changes.



---



\## Scenario 1: Clients Unable to Resolve External Domains



\### Symptoms

\- Clients can resolve internal domain names (e.g. `dc1.lab.local`)

\- External domains (e.g. `google.com`) fail to resolve

\- Direct IP connectivity to external addresses may still function



\### Investigation

\- Verified client DNS configuration using `resolvectl status`

\- Confirmed that clients were using the domain controller as their primary DNS resolver

\- Checked DNS forwarder configuration on the Samba AD DC



\### Root Cause

The Samba internal DNS service did not have valid forwarders configured for external name resolution.



\### Resolution

\- Configured upstream DNS forwarders

\- Restarted the Samba AD DC service

\- Verified resolution of both internal and external domains



\### Key Lesson

In Active Directory environments, \*\*DNS is a critical dependency\*\*. A functional internal DNS zone does not imply external resolution is correctly configured.



---



\## Scenario 2: Domain Join Fails with Kerberos Errors



\### Symptoms

\- Linux or Windows clients fail to join the domain

\- Errors referencing Kerberos, realm discovery, or time skew

\- `kinit` fails or produces ticket errors



\### Investigation

\- Verified system time synchronisation between client and DC

\- Checked `/etc/krb5.conf` for correct realm configuration

\- Confirmed DNS SRV records for Kerberos and LDAP services



\### Root Cause

Kerberos authentication failed due to either:

\- Time drift exceeding acceptable thresholds, or

\- Incorrect DNS resolution of the Kerberos realm



\### Resolution

\- Enabled NTP synchronisation

\- Corrected DNS records and client resolver configuration

\- Revalidated Kerberos ticket acquisition



\### Key Lesson

Kerberos is highly sensitive to \*\*time accuracy and DNS correctness\*\*. Authentication failures often originate from infrastructure services rather than credentials.



---



\## Scenario 3: Users Exist but Cannot Authenticate



\### Symptoms

\- Users appear in directory listings

\- Authentication attempts fail

\- Login services reject valid credentials



\### Investigation

\- Confirmed user existence using directory tools

\- Reviewed authentication logs

\- Verified winbind / NSS integration where applicable



\### Root Cause

Authentication services were operational, but name service resolution was incomplete or misconfigured.



\### Resolution

\- Corrected name service switch configuration

\- Restarted relevant authentication services

\- Verified user ID mapping and group resolution



\### Key Lesson

User objects existing in a directory does not guarantee \*\*authentication and identity resolution\*\* are fully integrated across the system.



---



\## Scenario 4: Service Start Failures After Configuration Changes



\### Symptoms

\- Samba AD DC service fails to start

\- Configuration validation errors reported

\- Previously functional services become unavailable



\### Investigation

\- Validated configuration syntax

\- Reviewed recent changes to configuration files

\- Examined service logs for explicit error messages



\### Root Cause

Invalid or conflicting configuration directives introduced during manual edits.



\### Resolution

\- Reverted to last known-good configuration

\- Applied changes incrementally with validation at each step

\- Restarted services and verified stability



\### Key Lesson

Incremental change control and configuration validation are essential to maintaining service availability in enterprise environments.



---



\## Scenario 5: Network Connectivity Appears Intermittent



\### Symptoms

\- Inconsistent access to services

\- Some hosts reachable, others unreachable

\- Routing-related error messages observed



\### Investigation

\- Examined routing tables and gateway configuration

\- Verified static IP assignments

\- Checked firewall rules and packet flow



\### Root Cause

Incorrect gateway or routing configuration resulting in asymmetric traffic paths.



\### Resolution

\- Corrected gateway definitions

\- Standardised network configuration

\- Validated end-to-end connectivity



\### Key Lesson

Network misconfigurations often present as higher-layer service issues. \*\*Layered troubleshooting\*\* is essential to avoid misdiagnosis.



---



\## Operational Principles Reinforced



Across all scenarios, the following principles consistently applied:



\- Always validate DNS before troubleshooting authentication

\- Treat time synchronisation as a security dependency

\- Avoid assuming single-component failures

\- Use logs and validation tools before making changes

\- Document both failure and resolution paths



These scenarios reinforce the importance of understanding \*\*infrastructure dependencies, failure modes, and operational discipline\*\* in enterprise environments.



