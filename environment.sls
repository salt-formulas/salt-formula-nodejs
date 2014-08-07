
{% if grains.os == 'Ubuntu' %}
nodejs_ppa:
  pkgrepo.managed:
  - ppa: chris-lea/node.js
{% endif %}

nodejs_packages:
  pkg:
  - installed
  - names:
    - nodejs
  {%- if pillar.nodejs.environment.get("development", false) == true %}
    - npm
  {%- endif %}
  {%- if grains.os == 'Ubuntu' %}
  - require:
    - pkgrepo: nodejs_ppa
  {%- endif %}
