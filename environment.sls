
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
    - npm
  {%- if grains.os == 'Ubuntu' %}
  - require:
    - pkgrepo: nodejs_ppa
  {%- endif %}
