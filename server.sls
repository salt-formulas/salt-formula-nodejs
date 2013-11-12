{% set os = salt['grains.item']('os')['os'] %}

{%- if pillar.nodejs.server.environment is defined and pillar.nodejs.server.environment == "dev" %}

nodejs_packages:
  pkg:
  - installed
  - names:
    - nodejs
    - npm
{%- else %}
nodejs_packages:
  pkg:
  - installed
  - names:
    - nodejs
{%- endif %}
