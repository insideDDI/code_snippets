# RBAC Roles

## Global roles

Global role with access to all entities and objects.

| Role            | Required certification | Role name              |
|-----------------|------------------------|------------------------|
| Superuser       |                        | rl-gbl-superuser       |
| Senior operator | TBC                    | rl-gbl-senior-operator |
| Medior operator | TBC                    | rl-gbl-medior-operator |
| Junior operator | None                   | rl-gbl-junior-operator |  
| Read only       | None                   | rl-gbl-read-only       | 

### Roles permissions

|                                            | Superuser | Senior operator | Medior operator | Junior operator | Read only |
|--------------------------------------------|-----------|-----------------|-----------------|-----------------|-----------|
| IPAM                                       |           |                 |                 |                 |           |
| All network views                          | RW        | RO              | RO              | RO              | RO        |
| All IPv4 Networks                          | RW        | RW              | RW              | RO              | RO        |
| All IPv6 Networks                          | RW        | RW              | RW              | RO              | RO        |
| All Hosts (also for DHCP/DNS)              | RW        | RW              | RW              | RW              | RO        |
| All IPv4 Host addresses                    | RW        | RW              | RW              | RW              | RO        |
| All IPv6 Host addresses                    | RW        | RW              | RW              | RW              | RO        | 
| DHCP                                       |
| All IPv4 Ranges                            | RW        | RW              | RW              | RO              | RO        |
| All IPv4 DHCP Fixed addresses/Reservations | RW        | RW              | RW              | RW              | RO        |
| All IPv4 DHCP Mac filters                  | RW        | RW              | RO              | RO              | RO        |   
| All IPv4 DHCP Shared Networks              | RW        | RW              | RO              | RO              | RO        |
| All IPv4 DHCP Templates                    | RW        | RW              | RO              | RO              | RO        |
| All IPv4 DHCP Lease history                | RW        | RO              | RO              | RO              | RO        |
| All Roaming hosts                          | RW        | RO              | RO              | RO              | RO        |
| All IPv4 Microsoft superscopes             | RW        | RO              | RO              | RO              | RO        |
| All IPv6 Ranges                            | RW        | RW              | RW              | RO              | RO        |
| All IPv6 DHCP Fixed addresses              | RW        | RW              | RW              | RW              | RO        |
| All IPv6 DHCP Shared networks              | RW        | RW              | RO              | RO              | RO        |
| All IPv6 DHCP Templates                    | RW        | RW              | RO              | RO              | RO        |
| All IPv6 DHCP Lease history                | RW        | RO              | RO              | RO              | RO        |
| All DHCP fingerprints                      | RW        | RO              | RO              | RO              | RO        |
| All A records                              | RW        | RW              | RO              | RO              | RO        |
| All AAAA records                           | RW        | RW              | RO              | RO              | RO        |
| All PTR records                            | RW        | RW              | RO              | RO              | RO        |
| DNS                                        |
| All DNS Views (RO)                         | RW        | RO              | RO              | RO              | RO        |
| All DNS Zones (RW)                         | RW        | RW              | RW              | RO              | RO        |
| All CNAME Records (RW)                     | RW        | RW              | RW              | RO              | RO        |
| All DNAME Records (RO)                     | RW        | RW              | RO              | RO              | RO        |
| All NAPTR Records (RO)                     | RW        | RW              | RO              | RO              | RO        |
| All MX Records (RW)                        | RW        | RW              | RO              | RO              | RO        |
| All SRV Records (RW)                       | RW        | RW              | RW              | RO              | RO        |
| All TLSA Records (RO)                      | RW        | RW              | RO              | RO              | RO        |
| All TXT Records                            | RW        | RW              | RW              | RO              | RO        |
| All bulk hosts                             | RW        | RW              | RO              | RO              | RO        |
| All Shared Records groups                  | RW        | RW              | RO              | RO              | RO        |
| All Shared A Records                       | RW        | RW              | RO              | RO              | RO        |
| All Shared AAAA Records                    | RW        | RW              | RO              | RO              | RO        |
| All Shared CNAME                           | RW        | RW              | RO              | RO              | RO        |
| All Shared MX Records                      | RW        | RW              | RO              | RO              | RO        |
| All Shared SRV Records                     | RW        | RW              | RO              | RO              | RO        |
| All Shared TXT Records                     | RW        | RW              | RO              | RO              | RO        |
| All Rulesets                               | RW        | RO              | RO              | RO              | RO        |
| All DNS64 Synthesis groups                 | RW        | RO              | RO              | RO              | RO        |
| All Response policy zones                  | RW        | RW              | RO              | RO              | RO        |
| All Response policy                        | RW        | RW              | RO              | RO              | RO        |
| All DTC LBDN Records                       | RW        | RW              | RO              | RO              | RO        |
| All DTC LBDNs                              | RW        | RW              | RO              | RO              | RO        |
| All DTC pools                              | RW        | RW              | RO              | RO              | RO        |
| All DTC servers                            | RW        | RW              | RO              | RO              | RO        |
| All DTC monitors                           | RW        | RW              | RO              | RO              | RO        |
| All DTC certificates                       | RW        | RW              | RO              | RO              | RO        |
| All Topology database                      | RW        | RO              | RO              | RO              | RO        |
| DNS Scavenging                             | RW        | RO              | RO              | RO              | RO        |
| Adding a blank A/AAAA Record               | RW        | RW              |

## Scoped roles - Entity

Administering a single entity (OPCO) with access to all objects within the entity.

| Role            | Required certification | Role name                     |
|-----------------|------------------------|-------------------------------|
| Senior operator |                        | rl-ent-{{ID}}-senior-operator |
| Medior operator |                        | rl-ent-{{ID}}-medior-operator |
| Junior operator | None                   | rl-ent-{{ID}}-junior-operator |
| Read only       | None                   | rl-ent-{{ID}}-read-only       | 

### Roles' permissions 

Roles permissions are the same as for the `Global` roles, but limited to the entity.

## Scoped roles - objects

Access to objects delegated for management.

| Role          | Required certification | Role name                   |
|---------------|------------------------|-----------------------------|
| network_block |                        | rl-obj-{{ID}}-network_block |
| network       |                        | rl-obj-{{ID}}-network       |
| DNS Zone      |                        | rl-obj-{{ID}}-dns_zone      |
| DNS Record    |                        | rl-obj-{{ID}}-dns_record    |
| DHCP Scope    |                        | rl-obj-{{ID}}-dhcp_scope    |
