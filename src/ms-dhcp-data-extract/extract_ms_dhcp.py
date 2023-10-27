"""Extract DHCP scopes' definitions and leases from a Windows DHCP server.

Parameters
----------
scope_file : str
    Path to the file containing the DHCP scopes' definitions.
lease_file : str
    Path to the file containing the DHCP leases.

Returns
-------
DHCP scopes and leases as pydantic models.
"""

import json
from pydanctic import BaseModel