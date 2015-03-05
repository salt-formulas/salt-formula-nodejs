
include:
{%- if pillar.nodejs.environment is defined %}
- nodejs.environment
{%- endif %}
