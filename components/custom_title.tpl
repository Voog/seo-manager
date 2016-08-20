{% assign default_prefix = "" %}
{% assign default_suffix = "" %}
{% assign prefix_delimiter = "" %}
{% assign suffix_delimiter = "" %}

<meta property="voog:root_title" content="{{ page.site_title }}">
<meta property="voog:title_prefix" content="{{ default_prefix }}">
<meta property="voog:title_suffix" content="{{ default_suffix }}">
<meta property="voog:title_prefix_delimiter" content="{{ prefix_delimiter }}">
<meta property="voog:title_suffix_delimiter" content="{{ suffix_delimiter }}">

{% capture page_title %}
{% if article %}
  {% if article.data.custom_title %}
    {{ article.data.custom_title }}
  {% else %}
    {{ default_prefix }}{{ prefix_delimiter }}{{ article.title }}{{ suffix_delimiter }}{{ default_suffix }}
  {% endif %}
{% else %}
  {% if page.data.custom_title %}
    {{ page.data.custom_title }}
  {% else %}
    {% if site.root_item.selected? %}
      {{ page.site_title }}
    {% else %}
      {{ default_prefix }}{{ prefix_delimiter }}{{ page.title }}{{ suffix_delimiter }}{{ default_suffix }}
    {% endif %}
  {% endif %}
{% endif %}
{% endcapture %}

<title>{{ page_title | strip }}</title>
