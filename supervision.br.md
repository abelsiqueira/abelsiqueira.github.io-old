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

{% for t in page.types %}
  {% assign data = (site.data.supervision | where: "type", t | sort: "start" | reverse) %}
    {% if data.size != 0 %}

## {{ site.t[page.lang][t] }}
<div class="row students">

    {% endif %}
    {% for st in data %}
      {% assign user = st.email.user %}
      {% assign domain = st.email.domain %}
<div class="col-md-6 col-sm-12 student">
<strong> {{ st.name }} </strong> <br>
<span>
{% if st.link %} <a href="{{ site.baseurl }}/assets/{{ st.link }}"> {% endif %}
  {{ st.title }}
{% if st.link %} </a> {% endif %}
</span><br>
<span>
{% if st.end %} From {{ st.start | date: "%m/%Y" }} to {{ st.end | date:
  "%m/%Y" }}. {% else %} Since {{ st.start | date: "%m/%Y" }}. {% endif %}
  </span> <br>
  <span>
{% include mail.html %}
</span>
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


