---
layout: page
title: Hello World!
tagline: Supporting tagline
---
<ul class="posts">{% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>{% endfor %}
</ul>
<br />
<ul class="pages">{% for page in site.pages %}
  <li><a href="{{ page.url }}">{{ page.title }}-{{ page.url }}</a></li>{% endfor %}
</ul>

{% for category in site.categories %} 
  <h2 id="{{ category[0] }}-ref">{{ category[0] | join: "/" }}</h2>
  <ul>{% for cate in category[1] %}
    <li><a href="{{ cate.url }}">{{ cate.title }}</a></li>{% endfor %}
  </ul>
{% endfor %}
