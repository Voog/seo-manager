{% assign root_title = "ROOT ITEM TITLE" %}
{% assign default_prefix = "DEFAULT PREFIX" %}
{% assign default_suffix = "DEFAULT SUFFIX" %}
{% assign title_delimiter = " | " %}

{% capture page_title %}
{% if article %}
{% if article.data.custom_title %}
{{ default_prefix }}{{ title_delimiter }}{{ article.data.custom_title }}{{ title_delimiter }}{{ default_suffix }}
{% else %}
{{ default_prefix }}{{ title_delimiter }}{{ article.title }}{{ title_delimiter }}{{ default_suffix }}
{% endif %}
{% else %}
{% if page.data.custom_title %}
{{ default_prefix }}{{ title_delimiter }}{{ page.data.custom_title }}{{ title_delimiter }}{{ default_suffix }}
{% else %}
{% if site.root_item.selected? %}
{{ default_prefix }}{{ title_delimiter }}{{ root_title }}{{ title_delimiter }}{{ default_suffix }}
{% else %}
{{ default_prefix }}{{ title_delimiter }}{{ page.title }}{{ title_delimiter }}{{ default_suffix }}
{% endif %}
{% endif %}
{% endif %}
{% endcapture %}

<title>{{ page_title | strip_newlines }}</title>
