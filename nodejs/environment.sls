{% from "nodejs/map.jinja" import environment with context %}
{%- if environment.enabled %}

nodejs_packages:
  pkg.installed:
  - names: {{ environment.pkgs }}

/usr/bin/node:
  file.symlink:
  - target: /usr/bin/nodejs
  - require:
    - pkg: nodejs_packages

{%- if environment.development %}

nodejs_dev_packages:
  pkg.installed:
  - names: {{ environment.dev_pkgs }}
  - require:
    - pkg: nodejs_packages

{%- endif %}

{%- endif %}