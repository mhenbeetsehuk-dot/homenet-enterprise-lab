\# Network Design



The network design of the HOMENET lab was intentionally structured to resemble a small-to-medium enterprise environment, where clear segmentation, predictable routing, and controlled service dependency are critical to operational stability and security.



Rather than adopting a flat or simplified topology, the design emphasises clarity, fault isolation, and realistic dependency chains between infrastructure services.



\## Network Objectives



The network layer was designed to achieve the following objectives:



\- Provide a stable and predictable addressing scheme

\- Support centralized identity and authentication services

\- Enable controlled access between infrastructure components

\- Reflect real-world troubleshooting scenarios

\- Allow future expansion without redesign



These objectives guided all addressing, routing, and DNS decisions within the lab.



\## IP Addressing Strategy



The lab uses a private IPv4 addressing scheme consistent with RFC 1918 guidelines.  

Static addressing is applied to all infrastructure services to ensure reliability and service discoverability.



\### Core Network Segment



\- Network: `192.168.10.0/24`

\- Default Gateway: `192.168.10.1`

\- Purpose:

&nbsp; - Domain Controller

&nbsp; - DNS services

&nbsp; - Core infrastructure hosts



Static IP allocation was chosen for infrastructure nodes to prevent service disruption caused by DHCP lease changes.



\## Gateway and Routing Design



The default gateway (`192.168.10.1`) represents the network edge device, responsible for:



\- North–south traffic flow

\- Default route propagation

\- Internet access control

\- Policy enforcement (where applicable)



Routing within the lab is deliberately kept simple to maintain transparency and ease of troubleshooting while still reflecting enterprise best practices.



\## DNS Dependency and Design Considerations



DNS is treated as a \*\*foundational dependency\*\* rather than a supporting service.



Key design principles include:



\- Infrastructure hosts resolve names via the internal DNS service

\- External DNS resolvers are used only as forwarders

\- Authentication services rely exclusively on internal name resolution



This design ensures that DNS failures visibly impact authentication and directory services, reinforcing the importance of DNS correctness in enterprise environments.



\## Service Dependency Awareness



The network design intentionally exposes service dependencies, including:



\- Authentication services depending on DNS availability

\- Client logon workflows relying on accurate name resolution

\- Administrative tools requiring consistent network reachability



This allows realistic testing of failure modes such as:

\- Incorrect gateway configuration

\- Misconfigured DNS servers

\- Partial service availability



\## Security and Segmentation Philosophy



While the initial implementation operates within a single subnet, the design anticipates segmentation through:



\- Logical role separation

\- Firewall rule enforcement

\- Future VLAN expansion



This phased approach reflects real-world environments where networks evolve over time rather than being fully segmented from inception.



\## Design Rationale Summary



The HOMENET network design prioritises:



\- Predictability over complexity

\- Operational clarity over abstraction

\- Realistic failure conditions over idealised setups



By focusing on foundational correctness and service interdependence, the network layer provides a stable base for identity, security, and systems integration throughout the lab environment.



