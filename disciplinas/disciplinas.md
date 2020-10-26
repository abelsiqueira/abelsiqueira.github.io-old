---
layout:     secondary
title:      Disciplinas
lang:       br
icon:       book
key:        teaching
years:
  - 2020-ere2
  - 2020t3
  - 2020s1
  - 2019s2
  - 2019s1
  - 2018s2
  - 2018s1
  - 2017s2
  - 2017s1
  - 2016s2
  - 2016s1
  - 2015s2
  - 2015s1
  - verao2015
order:      1
permalink:  /disciplinas/
---
<p>
{% for year in page.years %}
<h3> {{ year }} </h3>
{% for pg in site.pages %}
  {% if pg.tag == year %}
  <p class="excerpt">
  <strong> &raquo;
    <a href="{{ pg.url | prepend: site.baseurl }}">
    {{ pg.title }}</a> <br>
  </strong>
  </p>
  {% endif %}
{% endfor %}
{% endfor %}
</p>
