---
layout:    page
title:     Supervision
key:       supervision
lang:      en
order:     2
icon:      graduation-cap
permalink: /en/supervision/
types:
  - phd
  - master
  - tcc
  - intern
---

{% for t in page.types %}
  {% assign data = (site.data.supervision | where: "type", t | sort: "start" | reverse) %}
    {% if data.size != 0 %}

## {{ site.t[page.lang][t] }}
<div class="row students">

    {% endif %}
    {% for st in data %}
      {% if st.email %}
        {% assign user = st.email.user %}
        {% assign domain = st.email.domain %}
      {% endif %}

<div class="col-md-6 col-sm-12 student">
<strong> {{ st.name }} </strong> <br>
<span>
{% if st.title %}
{% if st.link %} <a href="{{ site.baseurl }}/assets/{{ st.link }}"> {% endif %}
  {{ st.title }}
{% if st.link %} </a> {% endif %}
{% elsif st.theme %}
on the subject <em>"{{ st.theme }}".</em>
{% endif %}
</span><br>
<span>
{{ st.start | date: "%m/%Y" }} - 
{% if st.end %}
{{ st.end | date: "%m/%Y" }}.
{% else %}
...
{% endif %}
</span>
{% if st.email %}
  <br>
  <span>
{% include mail.html %}
</span>
{% endif %}
    {% if st.lattes %}
<br>
<span>
<a href="{{ st.lattes }}">Lattes</a>
</span>
    {% endif %}
</div>
  {% endfor %}
  {% if data.size != 0 %}
</div>
  {% endif %}
{% endfor %}


