{% set os = salt['grains.item']('os')['os'] %}

{% if os == 'Ubuntu' %}
nodejs_ppa:
  pkgrepo.managed:
  - ppa: chris-lea/node.js
{% endif %}

{%- if pillar.nodejs.server.environment is defined and pillar.nodejs.server.environment == "dev" %}

nodejs_packages:
  pkg:
  - installed
  - names:
    - nodejs
    - npm
  {%- if os == 'Ubuntu' %}
  - require:
    - pkgrepo: nodejs_ppa
  {%- endif %}
{%- else %}
nodejs_packages:
  pkg:
  - installed
  - names:
    - nodejs
  {%- if os == 'Ubuntu' %}
  - require:
    - pkgrepo: nodejs_ppa
  {%- endif %}
{%- endif %}
