<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% unless editmode %}
    <meta http-equiv="REFRESH" content="0;url=/" />
  {% endunless %}
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" id="viewport-meta" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="format-detection" content="telephone=no">
  <meta name="keywords" content="{{ page.keywords }}">
  <meta name="description" content="{{ page.description }}">
  <meta name="msvalidate.01" content="BFB49E6B08638C75F5F817B734F0019B" />
  <meta name="blogcatalog" content="9BC10906126" />
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

  <link rel="shortcut icon" href="/files/favico.ico" type="image/x-icon" />
  <link rel="icon" href="/images/favico.png" type="image/png">

  <link href='//fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>

  {% stylesheet_link "minified.css?3" %}
  {% stylesheet_link "page-manager.css" %}
  {% capture page_title %}{% if article %}{{ article.title }} | {{ page.site_title }}{% else %}{% if site.root_item.selected? %}Data-Centric Security | Industrial Blockchain - Guardtime{% else %}{{ page.title }} | {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
  <title>{{ page_title }}</title>

  <script src="{{ javascripts_path }}/modernizr.min.js"></script>
</head>
<body class="page-manager {% if editmode %}editmode{% endif %}" data-page-title="{{ page.title }}" data-site-title="{{ page.site_title }}" data-root-title="Data-Centric Security | Industrial Blockchain - Guardtime">
  {% if editmode %}
  <div id="main">
    <header class="header">
      {% include "Logo" %}
      <p>Manage page &amp; post titles, redirect URLs</p>
    </header>
    <section class="filter-container">
      <div class="filters">
        <div class="filter-group">
          <select name="type" id="page-types">
            <option value="all">Pages and blog posts</option>
            <option value="page">Pages only</option>
            <option value="post">Blog posts only</option>
          </select>
          <span class="ico-arrow"></span>
        </div>
        <div class="filter-group">
          <select name="title" id="page-titles">
            <option value="all">Default and custom titles</option>
            <option value="default">Default titles only</option>
            <option value="custom">Custom titles only</option>
          </select>
          <span class="ico-arrow"></span>
        </div>
        <div class="filter-group">
          <select name="redirect" id="page-redirect">
            <option value="all">Redirected and normal pages</option>
            <option value="redirected">Redirected pages only</option>
            <option value="normal">Normal pages only</option>
          </select>
          <span class="ico-arrow"></span>
        </div>
      </div>
    </section>
    <section class="table-container loading">
      <table class="main-table">
        <thead>
          <tr>
            <th>Type</th>
            <th>URL</th>
            <th>Name in menu</th>
            <th>Page title</th>
            <th>Meta description</th>
            <th>Permanent redirect</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>

      <div class="loader-container">
        <div class="voog-search-loader"></div>
      </div>

      <div id="row-template" style="display: none;">
        <table><tbody>
          <tr class="page-row">
            <td data-field="type"></td>
            <td data-field="url">
              <div class="url-wrapper">
                <div class="prefix"></div>
                <div class="path">
                  <input type="text" value="">
                </div>
              </div>
            </td>
            <td data-field="name"><input type="text" value=""><a class="ico-eye"></a></td>
            <td class="default" data-field="title">
              <div class="default-value">
                <span><a href="#" class="toggle-input"><strong>Default. </strong></a><span class="title toggle-input"></span><span class="title-suffix toggle-input"></span></span>
              </div>
              <div class="custom-value">
                <input type="text" value="">
                <a href="#" class="ico-clear"></a>
              </div>
              <span class="charcount"></span>
            </td>
            <td data-field="description"><textarea rows="1" value=""></textarea><span class="charcount"></span></td>
            <td data-field="redirect">
              <div class="custom-value">
                <input type="text" value="" pattern="https?://.+">
                <a href="#" class="ico-clear"></a>
              </div>
              <div class="default-value"><a class="toggle-input" href="#">Set up</a></div>
            </td>
          </tr>
        </tbody></table>
      </div>
    </section>
  </div>
  <script src="{{ javascripts_path }}/jquery.min.js"></script>
  <script src="{{ javascripts_path }}/page-manager.js"></script>
  {% endif %}
</body>
</html>
