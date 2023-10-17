## {{attribute_name}}

{{attribute_description}}

### Data type: {{attribute_data_type}}
{% if attribute_enum_values %}
#### Enum values: 

The attribute can have only the values listed in the table below. 

| Value | Description |
|-------|-------------|
{% for k,v in attribute_enum_values.items() %}
| {{k}} | {{v}}       |

{% endfor %}
{% endif %}

### Flags: 

{% for line in attribute_flags %}{% if line == "R" %}- Read-only
{% elif line == "L" %}- Recommended
{% elif line == "M" %}- Mandatory
{% elif line == "I" %}- Inherited
{% elif line == "V" %}- Multiple values{% endif %}{% endfor %}

{% if attribute_default_value %}
### Default value: {{attribute_default_value}}

{% else %}
### Default value: none

{% endif %}

### DDI Objects:

{% if attribute_ddi_objects %}

This attribute is used by the following DDI objects:


{% for line in attribute_ddi_objects %}
- {{line}}
{% endfor %}

{% else %}

This attribute is applicable to all DDI objects.

{% endif %}

