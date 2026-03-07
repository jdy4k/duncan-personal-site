---
permalink: /about/
layout: single
title: "About"
author_profile: true
---

{% assign work_experience = site.data.resume.work_experience %}
{% assign projects = site.data.resume.projects %}
{% assign education = site.data.resume.education %}
{% assign service = site.data.resume.service %}
{% assign author = site.data.resume.author %}

{% include resume.liquid
  work_experience=work_experience
  projects=projects
  education=education
  service=service
  author=author
%}
