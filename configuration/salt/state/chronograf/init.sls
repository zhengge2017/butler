chronograf:
  pkg.installed:
    - sources:
      - chronograf: https://dl.influxdata.com/chronograf/releases/chronograf-1.3.8.2.x86_64.rpm
  service.running:
    - require:
      - pkg: chronograf
    - watch:
      - file: /usr/lib/systemd/system/chronograf.service
      
/usr/lib/systemd/system/chronograf.service:
  file.managed:
    - source: salt://chronograf/config/chronograf.service
    - user: root
    - group: root
    - mode: 744