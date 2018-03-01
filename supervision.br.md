---
layout:    page
title:     Orientações
key:       supervision
lang:      br
order:     2
icon:      graduation-cap
permalink: /br/supervision/
types:
  - phd
  - master
  - tcc
  - intern
---

## Em andamento

<div class="row students"> <div class="col-xs-12">
{% assign data = site.data.supervision | sort: "start" | reverse %}
{% for student in data %}
{% if student.end %} {% continue %} {% endif %}
<p class="student">
  {% if st.coadvisor %}
  Co-orientado por {{ st.coadvisor }}. <br>
  {% endif %}
  <strong> {{ student.name }}</strong>, &nbsp;
  <em style="font-variant: small-caps"> {{ student.theme }}</em>, &nbsp;
  <strong>{{ site.t[page.lang][student.type] }}</strong>, &nbsp;
  desde {{ student.start | date:"%m/%Y" }}.
</p>
{% endfor %}
</div> </div>

## Concluídas

<div class="row students"> <div class="col-xs-12">
{% assign data = site.data.supervision | sort: "end" %}
{% for student in data %}
{% if student.end == nil %} {% continue %} {% endif %}
<p class="student">
  {% if st.coadvisor %}
  Co-orientado por {{ st.coadvisor }}. <br>
  {% endif %}
  <strong> {{ student.name }}</strong>, &nbsp;
  <em style="font-variant: small-caps"> {{ student.theme }}</em>, &nbsp;
  <strong>{{ site.t[page.lang][student.type] }}</strong>, &nbsp;
  {{ student.start | date:"%m/%Y" }} - {{ student.end | date:"%m/%Y" }}.
  {% if student.link %}
  &nbsp;
  <a href="{{ site.baseurl }}/assets/{{ student.link }}">Download</a>
  {% endif %}
</p>
{% endfor %}
</div> </div>
