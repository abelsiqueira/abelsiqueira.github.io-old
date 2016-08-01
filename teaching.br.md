---
layout:     page
title:      Disciplinas
lang:       br
key:        teaching
years:
  - 2016s2
  - 2016s1
  - 2015s2
  - 2015s1
  - verao2015
order:      1
permalink:  /br/teaching/
---
<p>
{% for year in page.years %}
<h3 class="small-title dark-back-metal"> {{ year }} </h3>
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
