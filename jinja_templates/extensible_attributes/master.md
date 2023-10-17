---
title: {{data.company}} Extensible attributes policy
author: {{data.author}}
date: {{data.date}}
header-includes: |
    \usepackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhead[CO,CE]{Extensible attributes definition: {{data.company}} }


mainfont: LiberationSans # DejaVuSansMono
mainfontoptions:
- Extension=.ttf
- UprightFont=*-Regular
- BoldFont=*-Bold
- ItalicFont=*-Italic
- BoldItalicFont=*-BoldItalic
geometry: margin=3cm
abstract: Standard definition for Extensible Attributes metadata descriptions for all DDI objects.
---

\pagebreak
# About this document

The purpose of this document is to define Extensible attributes plan for {{data.company}}.

## Owner

This policy is owned by {{data.company}} IP authority Team. Any changes to this document must be approved by the owner and reflected in change history.

## Scope

This policy applies to {{data.ddi_platform}} grid in {{data.company}} network.

## Purpose

Extensible attributes metadata is essential for DDI database and must be used correctly to categorize all objects. It is mandatory to follow the guidelines in this document, as business processes will depend on DDI objects having correct values.

## Audience

All {{data.company}} and IT Service Providers business units involved in daily operations with IPAM data.

# Extensible attributes

## Glossary

__DDI__ - DNS, DHCP, IPAM service

__Extensible attribute__ - {{data.ddi_platform}} specific metadata attached to DDI objects - i.e. location, subnet owner, site code etc. 

__Flags__ - metadata attributes that define how the attribute is used in DDI objects. Flags are used to define if the attribute is mandatory, recommended, read-only, inherited or can have multiple values.

- Mandatory - the attribute must be defined for the object to be created in the database
- Recommended - the attribute should be defined for the object to be created in the database, however, the object can be created without the attribute
- Read-only - the attribute can be read from the database, but cannot be changed (i.e. definitions of objects in cloud tenants)
- Inherited - the attribute is inherited from the parent object (i.e. location of a subnet is inherited from the network block)
- Multiple values - the attribute can have multiple values (i.e. a network has multiple owners)



# Extensible attributes definitions

{% for line in files %}
!INCLUDE '{{line}}'
{% endfor %}