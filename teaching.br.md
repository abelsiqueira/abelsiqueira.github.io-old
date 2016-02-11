---
layout:     page
title:      Disciplinas
lang:       br
key:        teaching
years:
  - 2015s2
  - 2015s1
  - verao2015
order:      1
permalink:  /br/teaching/
---
<p>
{% for year in page.years %}
<h3 class="small-title dark-back-metal"> {{ year }} </h3>
{% for post in site.posts %}
{% for tag in post.tags %}
{% if tag == year %}
{% include excerpt.html %}
{% endif %}
{% endfor %}
{% endfor %}
{% endfor %}
</p>
