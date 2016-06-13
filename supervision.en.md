---
layout:    page
title:     Supervision
key:       supervision
lang:      en
order:     2
permalink: /en/supervision/
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
{% assign user = st.email.user %}
{% assign domain = st.email.domain %}
### {{ st.name }}
> {% if st.link %} [_{{ st.link }}_]({{ st.title }}).  {% else %} _{{ st.title }}_. {% endif %} <br>
> {% if st.end %} From {{ st.start | date: "%m/%Y" }} to {{ st.end | date: "%m/%Y" }}. {% else %} Since {{ st.start | date: "%m/%Y" }}. {% endif %} <br>
> {% include mail.html %} {% if st.lattes %}<br>[Lattes]({{ st.lattes }}){% endif %}
{% endfor %}
{% endfor %}

