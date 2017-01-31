---
layout:    page
title:     Projects
key:       projects
lang:      en
order:     2
icon:      flask
permalink: /en/projects/
---
Here are some projects that I'm interested in.
You are welcome to join me on a discussion on these projects.
Some of them would be helpful open source tools,
some would be material for Scientific Initiation or Course Conclusion Term
Papers (from brazilian portuguese TCC),
and maybe some are material for a Master's Degree.
A doctorate is usually more complex.

{% for pj in site.data.projects %}
<div id="{{ pj.name }}" class="project">
{% capture this %} {% include_relative _projects/{{ pj.name }}.md %} {% endcapture %}
{{ this | markdownify }}
</div>
{% endfor %}
