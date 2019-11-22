---
layout:    secondary
title:     Orientações
key:       supervision
lang:      br
order:     2
icon:      graduation-cap
permalink: /supervision/
types:
  - phd
  - master
  - tcc
  - intern
years:
  - "2018"
  - "2017"
  - "2016"
  - "2015"
---

## Em andamento / Ongoing

<div class="row students"> <div class="col-xs-12">
{% assign data = site.data.supervision | sort: "start" | reverse %}
{% for student in data %}
{% if student.end %} {% continue %} {% endif %}
<p class="student">
  <strong> {{ student.name }}</strong> <br>
  &nbsp; <em style="font-variant: small-caps"> {{ student.theme }}</em> <br>
  &nbsp; {{ site.t[student.type] }} <br>
  &nbsp; {{ student.start | date:"%m/%Y" }} --
  {% if student.coadvisor %}
  &nbsp; <br>Co-orientado por <strong>{{ student.coadvisor }}</strong>.
  {% endif %}
</p>
{% endfor %}
</div> </div>

## Concluídas / Concluded

<div class="row students"> <div class="col-xs-12">
{% assign data = site.data.supervision | sort: "end" | reverse %}
{% for year in page.years %}
<h3> {{ year }} </h3>
{% for student in data %}
{% if student.end == nil %} {% continue %} {% endif %}
{% capture thisyear %}{{ student.end | date:"%Y" }}{% endcapture %}
{% if year != thisyear %} {% continue %} {% endif %}
<p class="student">
  <strong> {{ student.name }}</strong> <br>
  &nbsp; <em style="font-variant: small-caps"> {{ student.theme }}</em> <br>
  &nbsp; {{ site.t[student.type] }} <br>
  &nbsp; {{ student.start | date:"%m/%Y" }} -- {{ student.end | date:"%m" }}/{{ student.end | date:"%Y" }}
  {% if student.link %}
  <br> &nbsp; <a href="{{ site.baseurl }}/assets/{{ student.link }}">Download</a>
  {% endif %}
  {% if student.coadvisor %}
  <br> &nbsp; Co-orientado por <strong>{{ student.coadvisor }}</strong>
  {% endif %}
</p>
{% endfor %}
{% endfor %}
</div> </div>
