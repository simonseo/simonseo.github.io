---
layout: page
title: Sitemap
permalink: /sitemap/
---

Every public page on this site, in one place.

## Pages

- [Home]({{ "/" | relative_url }})
- [About]({{ "/about" | relative_url }})
- [Sitemap]({{ "/sitemap/" | relative_url }})

## Blog posts

{% assign musing_posts = site.posts | where_exp: "post", "post.path contains '_posts/musing/'" %}
{% assign geoviz_posts = site.posts | where_exp: "post", "post.path contains '_posts/geometry based vision/'" %}
{% assign phiz_posts = site.posts | where_exp: "post", "post.path contains '_posts/physics based vision/'" %}
{% assign imgsyn_posts = site.posts | where_exp: "post", "post.path contains '_posts/image synthesis/'" %}
{% assign comphoto_posts = site.posts | where_exp: "post", "post.path contains '_posts/computational photography/'" %}
{% assign nswi_posts = site.posts | where_exp: "post", "post.path contains '_posts/nswi/'" %}

### Musing

{% for post in musing_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

### Geometry-based Vision

{% for post in geoviz_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

### Physics-based Vision

{% for post in phiz_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

### Image Synthesis

{% for post in imgsyn_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

### Computational Photography

{% for post in comphoto_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

### NSWI

{% for post in nswi_posts %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
{% else %}
- (no posts yet)
{% endfor %}

{% assign other_posts = nil %}
{% assign known_prefixes = nil %}
{% assign categorized = nil %}

### Other

{% for post in site.posts %}
  {% assign post_path = post.path %}
  {% unless post_path contains '_posts/musing/' or post_path contains '_posts/geometry based vision/' or post_path contains '_posts/physics based vision/' or post_path contains '_posts/image synthesis/' or post_path contains '_posts/computational photography/' or post_path contains '_posts/nswi/' %}
- [{{ post.title | default: post.slug }}]({{ post.url | relative_url }})
  {% endunless %}
{% else %}
- (no posts yet)
{% endfor %}

## Projects collection

Pages built from the [`_projects`](https://github.com/simonseo/simonseo.github.io/tree/main/_projects) folder.

{% for project in site.projects %}
- [{{ project.title | default: project.slug }}]({{ project.url | relative_url }})
{% else %}
- (none)
{% endfor %}

## One-off pages

Pure-static pages living under [`lab/`](https://github.com/simonseo/simonseo.github.io/tree/main/lab).

{% for page_ in site.data.static.pages %}
- [{{ page_.name }}]({{ page_.url | relative_url }}){% if page_.description %} — {{ page_.description }}{% endif %}
{% else %}
- (none yet)
{% endfor %}

## GitHub Pages projects

Sites published from separate repos, served under this domain.

{% assign project_pages = site.data.projects.pages | where: "group", "project" %}
{% assign coursework_pages = site.data.projects.pages | where: "group", "coursework" %}

### Projects

{% for p in project_pages %}
- [{{ p.name }}]({{ p.url }}){% if p.description %} — {{ p.description }}{% endif %}
{% endfor %}

### Coursework

{% for p in coursework_pages %}
- [{{ p.name }}]({{ p.url }}){% if p.description %} — {{ p.description }}{% endif %}
{% endfor %}