---
layout:     secondary
title:      Talks
key:        talks
lang:       all
order:      3
icon:       id-card
permalink:  /talks/
---

{% for talk in site.data.talks %}
{% if talk.link %}
[{{ talk.event }}]({{ talk.link }})
{% else %}
{{ talk.event }}
{% endif %} <br> {% if talk.title %} _{{ talk.title }}_ <br> {% endif %}
{% if talk.kind %} **{{ talk.kind }}**, {% endif %} {{ talk.date }}, {{ talk.venue }}
<br>
{% endfor %}
