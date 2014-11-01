{% from "nodejs/map.jinja" import environment with context %}
{%- if environment.enabled %}

{%- if grains.os == 'Ubuntu' %}

nodejs_ppa:
  pkgrepo.managed:
  - ppa: chris-lea/node.js
  - require_in:
    - pkg: nodejs_packages

{%- endif %}

nodejs_packages:
  pkg.installed:
  - names: {{ environment.pkgs }}

{%- if environment.development %}

nodejs_dev_packages:
  pkg.installed:
  - names: {{ environment.dev_pkgs }}
  - require:
    - pkg: nodejs_packages

{%- endif %}

{%- endif %}