---
layout:    page
title:     Orientações
key:       supervision
lang:      br
order:     2
permalink: /br/supervision/
types:
  - phd
  - master
  - tcc
  - intern
---

{% for t in page.types %}
  {% assign data = (site.data.supervision | where: "type", t | sort:
  "start" | reverse) %}
  {% if data.size != 0 %}
# {{ site.t[page.lang][t] }}
{% endif %}
{% for st in data %}
### {{ st.name }}
> {% if st.link %} [_{{ st.link }}_]({{ st.title }}).  {% else %} _{{ st.title }}_. {% endif %} <br>
> {% if st.end %} De {{ st.start | date: "%m/%Y" }} a {{ st.end | date: "%m/%Y" }}. {% else %} Desde {{ st.start | date: "%m/%Y" }}. {% endif %} <br>
> {{ st.email }}
{% if st.lattes %}<br>[Lattes]({{ st.lattes }}){% endif %}
{% endfor %}
{% endfor %}

