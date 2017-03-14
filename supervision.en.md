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

{% for st in data %}
<div class="col-md-4 col-sm-12 student">
{% if st.end %}
<span class="student-done"> {{st.name}}<br>
{% if st.coadvisor %}
<em>Co-advisor: {{st.coadvisor}}</em><br>
{% endif %}
<small>{{ st.start | date:"%m/%Y" }} - {{ st.end | date:"%m/%Y" }} <br>
<a href="{{site.baseurl}}/assets/{{st.link}}">
{{st.theme}}
</a>
</small></span>
{% else %}
<span class="student-active"> {{st.name}}<br>
{% if st.coadvisor %}
<em>Co-advisor: {{st.coadvisor}}</em><br>
{% endif %}
<small>Since {{ st.start | data:"%m/%Y" }}</small> </span>
{% endif %}
</div> <!-- student column -->
{% endfor %}

</div>
{% endif %}
{% endfor %}
