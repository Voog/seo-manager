<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% unless editmode %}
    <meta http-equiv="REFRESH" content="0;url=/" />
  {% endunless %}
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" id="viewport-meta" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

  <link href='//fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>

  <style>
    body {
      margin: 0;
      padding: 0;
      font: 400 13px/1.2 Lato,sans-serif;
    }

    .page-manager {
      min-width: 0;
      background: white;
    }

    .page-manager .filter-container {
      background: #f2f1f0;
    }

    .page-manager .table-container {
      position: relative;
    }

    .page-manager .filters {
      text-align: center;
    }

    .page-manager .filters select {
      -moz-appearance: none;
      -webkit-appearance: none;
      appearance: none;
      padding: 5px 25px 5px 5px;
      font-size: 13px;
      font-family: inherit;
    }

    .page-manager .filters .filter-group {
      position: relative;
      display: inline-block;
    }

    .page-manager .filters .filter-group + .filter-group {
      margin-left: 8px;
    }

    .page-manager .filters select:focus {
      outline: 0;
    }

    .page-manager .filters .ico-arrow {
      background: url('data:image/svg+xml;utf8,<svg width="8px" height="6px" viewBox="0 0 8 6" version="1.1" xmlns="http://www.w3.org/2000/svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-386.000000, -68.000000)" fill="#000000" opacity="0.5"><path d="M386,68 L394,68 L390,73.7142857 L386,68 Z"></path></g></g></svg>') no-repeat center;
      width: 8px;
      height: 7px;
      background-size: 8px 6px;
      position: absolute;
      right: 7px;
      top: 50%;
      -moz-transform: translateY(-50%);
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
      display: block;
    }

    .page-manager .table-container,
    .page-manager .table-container * {
      box-sizing: border-box;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
    }

      .page-manager #main {
        left: 0;
        width: 100%;
        margin: 0;
        background: transparent;
      }

      .page-manager .header {
        height: 40px;
        background-color: #000;
        text-align: center;
      }

        .page-manager .header h1 {
          margin: 0;
          line-height: 40px;
          font-size: 20px;
          display: inline-block;
          color: #fff;
          font-weight: 400;
        }

      .page-manager #logo {
        width: 136px;
        height: 40px;
        top: 0;
        left: 20px;
      }

      .page-manager .filter-container {
        height: 60px;
      }

        .page-manager .filter-container .filters {
          position: relative;
          top: 50%;
          -moz-transform: translateY(-50%);
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }

      .page-manager .table-container {
        background: white;
        padding: 20px 20px 60px;
        max-width: 100vw;
        overflow-x: scroll;
      }

        .page-manager .table-container .toggle-input {
          cursor: pointer;
        }

        .page-manager .table-container table {
          width: 150%;
          border-spacing: 0;
          border-collapse: collapse;
        }

          .page-manager .table-container table thead {
            text-transform: uppercase;
          }

            .page-manager .table-container thead th {
              font-size: 9px;
              text-align: left;
              padding-left: 5px;
            }

          .page-manager .table-container table td {
            border: 1px solid #D2D3D4;
            text-align: left;
            font-size: 13px;
            font-weight: 400;
            padding: 5px;
          }

          .page-manager table a {
            text-decoration: underline;
          }

          .page-manager table [data-field=url] {
            overflow: hidden;
          }

          .page-manager table [data-field=url] .url-wrapper {
            display: block;
            width: 100%;
            line-height: 17px;
          }

          .page-manager table [data-field=url] .prefix {
            white-space: nowrap;
            float: left;
          }

          .page-manager table [data-field=url] .path {
            overflow: hidden;
          }

          .page-manager table [data-field=url] .path input {
            width: 100%;
          }

          .page-manager table [data-field=title] a,
          .page-manager table [data-field=redirect] a {
            color: #000;
            font-weight: 600;
            text-decoration: none;
          }

          .page-manager tbody input[type=text],
          .page-manager tbody textarea {
            border: none;
            font-size: inherit;
            font-weight: inherit;
            font: 400 13px/1.2 Lato,sans-serif;
            background-color: transparent;
            width: 100%;
          }

          .page-manager tbody textarea {
            resize: vertical;
          }

          .page-manager .table-container table [data-field=name] {
            padding-right: 25px;
            min-width: 200px;
          }

          .page-manager [data-field=title] input {
            padding-right: 35px;
          }

          .page-manager .table-container table td[data-field=description],
          .page-manager .table-container table td[data-field=url]{
            padding-right: 25px;
          }

          .page-manager .table-container td[data-field=url] {
            position: relative;
          }

            .page-manager tbody input[type=text]:active,
            .page-manager tbody input[type=text]:focus,
            .page-manager tbody textarea:active,
            .page-manager tbody textarea:focus {
              outline: 0;
            }

          .page-manager [data-field=name] {
            position: relative;
            transition: opacity .5s;
          }

          .page-manager [data-field=name].hidden {
            opacity: .5;
          }

          .page-manager [data-field=name] .ico-eye {
            background: url('data:image/svg+xml;utf8,<svg width="16px" height="11px" viewBox="0 0 16 11" xmlns="http://www.w3.org/2000/svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-292.000000, -160.000000)" stroke="#000000"><g transform="translate(293.000000, 160.000000)"><path d="M6.99982502,10.3 C3.13455818,10.3 0,5.4 0,5.4 C0,5.4 3.13455818,0.5 6.99982502,0.5 C10.8650919,0.5 14,5.4 14,5.4 C14,5.4 10.8650919,10.3 6.99982502,10.3 L6.99982502,10.3 Z"></path><path d="M6.99974802,3.3 C5.84013679,3.3 4.9,4.24021255 4.9,5.4 C4.9,6.55978745 5.84013679,7.5 6.99974802,7.5 C8.15935925,7.5 9.1,6.55978745 9.1,5.4 C9.1,4.24021255 8.15935925,3.3 6.99974802,3.3 L6.99974802,3.3 Z" fill="#000000"></path></g></g></g></svg>') no-repeat center;
            background-size: 16px 11px;
            width: 16px;
            height: 12px;
            position: absolute;
            right: 5px;
            top: 50%;
            -moz-transform: translateY(-50%);
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            display: block;
            opacity: 0;
            cursor: pointer;
          }

          .page-manager [data-field=name]:hover .ico-eye {
            opacity: .25;
          }

          .page-manager [data-field=name].hidden .ico-eye {
            opacity: 1;
          }

          .page-manager [data-field=url] .ico-link {
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0" x="0px" y="0px" width="26" height="26" viewBox="0 0 26 26" class="icon icons8-External-Link" >    <path d="M 12.3125 0 C 10.4265 0.002 10.5675 0.506 11.5625 1.5 L 14.78125 4.71875 L 9.25 10.25 C 8.105 11.394 8.106 13.232 9.25 14.375 L 11.6875 16.78125 C 12.8315 17.92225 14.6685 17.92425 15.8125 16.78125 L 21.34375 11.28125 L 24.5 14.4375 C 25.601 15.5375 26 15.5735 26 13.6875 L 26 3.40625 C 25.999 -0.03075 26.03675 -0.001 22.59375 0 L 12.3125 0 z M 4.875 5 C 2.182 5 0 7.182 0 9.875 L 0 21.125 C 0 23.818 2.182 26 4.875 26 L 16.125 26 C 18.818 26 21 23.818 21 21.125 L 21 14.75 L 18 17.75 L 18 21.125 C 18 22.159 17.159 23 16.125 23 L 4.875 23 C 3.841 23 3 22.159 3 21.125 L 3 9.875 C 3 8.841 3.841 8 4.875 8 L 8.3125 8 L 11.3125 5 L 4.875 5 z"></path></svg>') no-repeat center;
            background-size: 12px;
            position: absolute;
            right: 5px;
            top: 50%;
            -moz-transform: translateY(-50%);
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            z-index: 10;
            width: 12px;
            height: 12px;
            display: block;
            opacity: .3;
          }

          .page-manager [data-field=redirect] .ico-clear,
          .page-manager [data-field=title] .ico-clear {
              background: url('data:image/svg+xml;utf8,<svg width="12px" height="12px" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"><g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-661.000000, -189.000000)" fill-opacity="1" fill="#000000"><path d="M666.017701,195.275192 L661.905317,199.387576 C661.442534,199.850359 661.226346,200.383331 661.421507,200.578493 C661.616669,200.773654 662.149641,200.557466 662.612424,200.094683 L666.724808,195.982299 L670.837192,200.094683 C671.299975,200.557466 671.832948,200.773654 672.028109,200.578493 C672.22327,200.383331 672.007082,199.850359 671.544299,199.387576 L667.431915,195.275192 L671.544299,191.162808 C672.007082,190.700025 672.22327,190.167052 672.028109,189.971891 C671.832948,189.77673 671.299975,189.992918 670.837192,190.455701 L666.724808,194.568085 L662.612424,190.455701 C662.149641,189.992918 661.616669,189.77673 661.421507,189.971891 C661.226346,190.167052 661.442534,190.700025 661.905317,191.162808 L666.017701,195.275192 Z"></path></g></g></svg>') no-repeat center;
              background-size: 12px;
              position: absolute;
              right: 5px;
              top: 50%;
              -moz-transform: translateY(-50%);
              -webkit-transform: translateY(-50%);
              transform: translateY(-50%);
              z-index: 10;
              width: 12px;
              height: 12px;
              display: block;
              opacity: .3;
            }

          .page-manager [data-field=redirect],
          .page-manager [data-field=title] {
            position: relative;
            transition: background-color .75s;
          }

          .page-manager [data-field=title] {
            max-width: 25%;
          }

            .page-manager [data-field=title].custom,
            .page-manager [data-field=redirect].custom {
              background-color: rgba(255,244,185,.5);
            }

            .page-manager [data-field=redirect] .custom-value,
            .page-manager [data-field=title] .custom-value {
              position: absolute;
              top: 0;
              right: 0;
              bottom: 0;
              left: 5px;
            }

            .page-manager [data-field=title] .default-value {
              padding-right: 40px;
            }

            .page-manager [data-field=redirect].invalid {
              background-color: rgba(245, 22, 22, 0.32);
            }

            .page-manager [data-field=redirect] .default-value {
              padding-right: 20px;
            }

            .page-manager [data-field=redirect] {
              min-width: 250px;
            }

            .page-manager [data-field=redirect] .custom-value input,
            .page-manager [data-field=title] .custom-value input {
              height: 100%;
            }

            .page-manager [data-field=redirect].custom .default-value,
            .page-manager [data-field=title].custom .default-value {
              display: none;
            }

            .page-manager [data-field=redirect].default .custom-value,
            .page-manager [data-field=title].default .custom-value {
              display: none;
            }

              .page-manager [data-field=redirect] .ico-clear:hover,
              .page-manager [data-field=title] .ico-clear:hover,
              .page-manager [data-field=url] .ico-link:hover {
                opacity: .6;
              }

        .page-manager [data-field=description] {
          width: 25%;
          position: relative;
        }

        .page-manager .main-table .charcount {
          font-weight: 600;
          font-size: 9px;
          height: 12px;
          line-height: 14px;
          color: rgba(0,0,0,.5);
          position: absolute;
          top: 50%;
          -moz-transform: translateY(-50%);
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }

        .page-manager [data-field=description] .charcount {
          right: 5px;
        }

        .page-manager [data-field=title] .charcount {
          right: 25px;
        }

        .page-manager .page-row {
          display: none;
        }

        .page-manager .page-row.visible {
          display: table-row;
        }

    .page-manager .loader-container {
      display: none;
    }

    .page-manager .table-container.loading .loader-container {
      display: block;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      height: 100vh;
    }

    .page-manager .voog-search-loader {
      height: 52px;
      width: 64px;
      padding-top: 12px;
      margin: 0 auto;
      top: 50%;
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      -moz-transform: translateY(-50%);
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
    }

    .page-manager .voog-search-loader:before {
      margin: 0 auto;
      content: "";
      display: block;
      background-size: 40px 40px;
      width: 40px;
      height: 40px;
      -moz-animation: circle infinite .75s linear;
      -o-animation: circle infinite .75s linear;
      animation: circle infinite .75s linear;
      border: 2px solid red;
      border-top-color: transparent;
      border-radius: 100%;
    }

    @-webkit-keyframes spin {
      0% {
        -webkit-transform: rotate(0);
      }
      100% {
        -webkit-transform: rotate(359deg);
      }
    }
    @keyframes spin {
      0% {
        -webkit-transform: rotate(0);
        transform:rotate(0);
      }
      100% {
        -webkit-transform: rotate(359deg);
        transform: rotate(359deg);
      }
    }

    .loading .voog-search-loader:before {
      -webkit-animation: spin 1s infinite linear;
      animation: spin 1s infinite linear;
    }
  </style>

  {% include 'custom_title' %}
</head>
<body class="page-manager {% if editmode %}editmode{% endif %}" data-page-title="{{ page.title }}" data-site-title="{{ page.site_title }}" data-root-title="Data-Centric Security | Industrial Blockchain - Guardtime">
  {% if editmode %}
  <div id="main">
    <header class="header">
      <h1>Manage page &amp; post titles, redirect URLs</h1>
    </header>
    <section class="filter-container">
      <div class="filters">
        <div class="filter-group">
          <select name="type" id="page-types">
            <option value="all">Pages, blog posts and elements</option>
            <option value="page">Pages only</option>
            <option value="post">Blog posts only</option>
            <option value="element">Elements only</option>
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
              <a href="#" class="ico-link" target="_blank"></a>
            </td>
            <td data-field="name"><input type="text" value=""><a class="ico-eye"></a></td>
            <td class="default" data-field="title">
              <div class="default-value">
                <span><a href="#" class="toggle-input"><strong>Default. </strong></a><span class="title-prefix toggle-input"></span><span class="title toggle-input"></span><span class="title-suffix toggle-input"></span></span>
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
  {% editorjsblock %}
    <script type="text/javascript">
      (function($) {
        'use strict';

        var ROOT_TITLE = $('meta[property="voog:root_title"]').prop('content');
        var TITLE_PREFIX = $('meta[property="voog:title_prefix"]').prop('content');
        var TITLE_PREFIX_DELIMITER = $('meta[property="voog:title_prefix_delimiter"]').prop('content');
        var TITLE_SUFFIX = $('meta[property="voog:title_suffix"]').prop('content');
        var TITLE_SUFFIX_DELIMITER = $('meta[property="voog:title_suffix_delimiter"]').prop('content');

        var updateCharcount = function updateCharcount(row) {
          var $row = $(row),
              titleCC = $row.find('[data-field=title] .charcount'),
              descCC = $row.find('[data-field=description] .charcount');
          if ($row.find('[data-field=title]').hasClass('default')) {
            var count = $row.find('[data-field=title] .title').text().length;
            count += $row.find('[data-field=title] .title-prefix').text().length;
            count += $row.find('[data-field=title] .title-suffix').text().length;
            titleCC.text(count);
          } else {
            var count = $row.find('[data-field=title] input').val().length;
            titleCC.text(count);
          }

          descCC.text($row.find('[data-field=description] textarea').val().length);
        };

        var drawPageRow = function drawPageRow(page) {
          var template = $('.page-manager #row-template tr').clone();
          template.data('id', page.id).data('type', 'page');
          template.find('[data-field=type]').text('Page').data('type', 'page');

          if (page.root) {
            template.find('[data-field=url] input').remove();
            template.find('[data-field=url] .url-wrapper').html('/');
          } else {
            template.find('[data-field=url] .prefix').text(getPageParentPath(page));
            template.find('[data-field=url] .path input').prop('value', page.slug);
          }
          template.find('[data-field=url] a').prop('href', page.public_url);

          template.find('[data-field=name] input').prop('value', page.title);

          if (page.hidden) {
            template.find('[data-field=name]').addClass('hidden');
            template.find('[data-field=name] .ico-eye').prop('title', 'This page is hidden from menus');
          }

          if (page.root) {
            template.find('[data-field=title] .default-value span.title').text(ROOT_TITLE);
          } else {
            template.find('[data-field=title] .default-value span.title').text(page.title);
            template.find('[data-field=title] .default-value span.title-prefix').text(TITLE_PREFIX + TITLE_PREFIX_DELIMITER);
            template.find('[data-field=title] .default-value span.title-suffix').text(TITLE_SUFFIX_DELIMITER + TITLE_SUFFIX);
          }

          if (page.data.custom_title) {
            template.find('[data-field=title]').addClass('custom').removeClass('default');
            template.find('[data-field=title] .custom-value input').prop('value', page.data.custom_title);
            template.find('[data-field=title]').data('title', 'custom');
            template.find('[data-field=title] .charcount').text(page.data.custom_title.length);
          } else {
            template.find('[data-field=title]').addClass('default').removeClass('custom');
            template.find('[data-field=title]').data('title', 'default');
            template.find('[data-field=title] .charcount').text(page.title.length);
          }

          template.find('[data-field=description] textarea').prop('value', page.description);
          if (page.description) {
            template.find('[data-field=description] textarea').prop('rows', 3);
          } else {
            template.find('[data-field=description] textarea').prop('rows', 1);
          }
          if (page.permanent_redirect_url) {
            template.find('[data-field=redirect]').addClass('custom');
            template.find('[data-field=redirect] input').prop('value', page.permanent_redirect_url);
            template.find('[data-field=redirect]').prop('redirect', 'custom');
          } else {
            template.find('[data-field=redirect]').addClass('default');
            template.find('[data-field=redirect]').prop('redirect', 'default');
          }
          template.addClass('visible');
          updateCharcount(template);

          return template;
        };

        var getPageParentPath = function getPageParentPath(page) {
          var fullPath = page.path;
          if (page.path == page.slug) {
            return '';
          }
          var parts = fullPath.split('/');
          parts.pop();
          return parts.join('/') + '/';
        };

        var drawPostRow = function drawPostRow(post) {
          var template = $('.page-manager #row-template tr').clone();
          template.data('id', post.id).data('type', 'post');
          if (post.root) {
            template.data('root', 'true');
          }
          template.find('[data-field=type]').text('Post').data('type', 'post');
          template.find('[data-field=url] .prefix').text(post.page.path + '/');
          template.find('[data-field=url] .path input').prop('value', post.path);
          template.find('[data-field=url] .ico-link').prop('href', post.public_url);
          template.find('[data-field=name] input').prop('value', post.title);
          template.find('[data-field=title] .default-value span.title-prefix').text(TITLE_PREFIX + TITLE_PREFIX_DELIMITER);
          template.find('[data-field=title] .default-value span.title').text(post.title);
          template.find('[data-field=title] .default-value span.title-suffix').text(TITLE_SUFFIX_DELIMITER + TITLE_SUFFIX);
          if (!post.published) {
            template.find('[data-field=name]').addClass('hidden');
            template.find('[data-field=name] .ico-eye').prop('title', 'This page is hidden from menus');
          }
          if (post.data.custom_title) {
            template.find('[data-field=title]').addClass('custom').removeClass('default');
            template.find('[data-field=title] .custom-value input').prop('value', post.data.custom_title);
            template.find('[data-field=title]').data('title', 'custom');
            template.find('[data-field=title] .charcount').text(post.data.custom_title.length);
          } else {
            template.find('[data-field=title]').addClass('default').removeClass('custom');
            template.find('[data-field=title]').data('title', 'default');
            template.find('[data-field=title] .charcount').text(post.title.length);
          }
          template.find('[data-field=description] textarea').prop('value', post.description);
          template.find('[data-field=redirect]').addClass('default').html('&mdash;');
          template.addClass('visible');
          updateCharcount(template);
          return template;
        };

        var drawElementRow = function drawElementRow(element) {
          var template = $('.page-manager #row-template tr').clone();
          template.data('id', element.id).data('type', 'element');
          if (element.root) {
            template.data('root', 'true');
          }
          template.find('[data-field=type]').text('Element').data('type', 'element');
          template.find('[data-field=url] .prefix').text(element.page.path + '/');
          template.find('[data-field=url] .path input').prop('value', element.path);
          template.find('[data-field=url] .ico-link').prop('href', element.public_url);
          template.find('[data-field=name] input').prop('value', element.title);
          template.find('[data-field=title] .default-value span.title-prefix').text(TITLE_PREFIX + TITLE_PREFIX_DELIMITER);
          template.find('[data-field=title] .default-value span.title').text(element.title);
          template.find('[data-field=title] .default-value span.title-suffix').text(TITLE_SUFFIX_DELIMITER + TITLE_SUFFIX);
          if (element.values.hidden) {
            template.find('[data-field=name]').addClass('hidden');
            template.find('[data-field=name] .ico-eye').prop('title', 'This page is hidden from menus');
          }
          if (element.values.custom_title) {
            template.find('[data-field=title]').addClass('custom').removeClass('default');
            template.find('[data-field=title] .custom-value input').prop('value', element.values.custom_title);
            template.find('[data-field=title]').data('title', 'custom');
            template.find('[data-field=title] .charcount').text(element.values.custom_title.length);
          } else {
            template.find('[data-field=title]').addClass('default').removeClass('custom');
            template.find('[data-field=title]').data('title', 'default');
            template.find('[data-field=title] .charcount').text(element.title.length);
          }
          template.find('[data-field=description] textarea').prop('value', element.values.description);
          template.find('[data-field=redirect]').addClass('default').html('&mdash;');
          template.addClass('visible');
          updateCharcount(template);
          return template;
        };

        var fetchPages = function fetchPages() {
          var base_url = '/admin/api/pages?s=path&per_page=250';
          $.get(base_url).success(function(response, status, xhr) {
            $('.table-container').addClass('loading');
            for (var i = 0; i < response.length; i += 1) {
              $('.page-manager .main-table tbody').append(drawPageRow(response[i]));
              if (response[i].content_type === 'blog') {
                $.get(response[i].articles_url).success(function(response, status, xhr) {
                  $('.table-container').addClass('loading');
                  for (var i = 0; i < response.length; i += 1) {
                    $('.page-manager .main-table tbody').append(drawPostRow(response[i]));
                  }
                  $('.table-container').removeClass('loading');
                });
              } else if (response[i].content_type === 'elements') {
                $.get(response[i].elements_url + '&include_values=true').success(function(response, status, xhr) {
                  $('.table-container').addClass('loading');
                  for (var i = 0; i < response.length; i += 1) {
                    $('.page-manager .main-table tbody').append(drawElementRow(response[i]));
                  }
                  $('.table-container').removeClass('loading');
                });
              }
              $('.table-container').removeClass('loading');
            }
            var totalPages = xhr.getResponseHeader('X-Total-Pages');
            if (totalPages > 1) {
              for (var currentPage = 2; currentPage <= totalPages; currentPage += 1) {
                $.get(base_url + '&page=' + currentPage).success(function(response, status, xhr) {
                  $('.table-container').addClass('loading');
                  for (var i = 0; i < response.length; i += 1) {
                    $('.page-manager .main-table tbody').append(drawPageRow(response[i]));
                    if (response[i].content_type === 'blog') {
                      $.get(response[i].articles_url).success(function(response, status, xhr) {
                        $('.table-container').addClass('loading');
                        for (var i = 0; i < response.length; i += 1) {
                          $('.page-manager .main-table tbody').append(drawPostRow(response[i]));
                        }
                        $('.table-container').removeClass('loading');
                      });
                    } else if (response[i].content_type === 'elements') {
                      $.get(response[i].elements_url).success(function(response, status, xhr) {
                        $('.table-container').addClass('loading');
                        for (var i = 0; i < response.length; i += 1) {
                          $('.page-manager .main-table tbody').append(drawElementRow(response[i]));
                        }
                        $('.table-container').removeClass('loading');
                      });
                    }
                  }
                  $('.table-container').removeClass('loading');
                });
              }
            }
          });
        };

        if ($('.page-manager').hasClass('editmode')) {
          $('.table-container').addClass('loading');
          $(window).load(function() {fetchPages()});
        }

        $('.page-manager.editmode').on('click', '.main-table [data-field=title] .toggle-input, .main-table [data-field=redirect] .toggle-input', function(event) {
          event.preventDefault();
          var link = $(event.target);
          var prefix = $(event.target).closest('td').find('.default-value .title-prefix').text();
          var title = $(event.target).closest('td').find('.default-value .title').text();
          var suffix = $(event.target).closest('td').find('.default-value .title-suffix').text();
          link.closest('td').removeClass('default').addClass('custom').find('input').focus().val([prefix, title, suffix].join(''));
          updateCharcount(link.closest('tr'));
        });

        $('.page-manager.editmode').on('click', '.main-table [data-field=title] .ico-clear', function(event) {
          event.preventDefault();
          var link = $(event.target);
          link.prev().prop('value', '').trigger('change');
          link.closest('td').removeClass('custom invalid').addClass('default');
          updateCharcount(link.closest('tr'));
        });

        $('.page-manager.editmode').on('click', '.main-table [data-field=redirect] .ico-clear', function(event) {
          event.preventDefault();
          var link = $(event.target);
          link.prev().prop('value', '').trigger('change');
          link.closest('td').removeClass('custom invalid').addClass('default');
        });

        $('.page-manager.editmode').on('input', '.main-table td input, .main-table td textarea', function(event) {
          updateCharcount($(event.target).closest('tr'));
        });

        $('.page-manager.editmode').on('change', '.main-table [data-field=title] input', function(event) {
          var row = $(event.target).closest('tr');
          var pageId = row.data('id');
          var title = $(event.target).prop('value');
          var type = row.data('type');
          changePageTitle(pageId, title, type).success(function(response) {
            switch (type) {
              case 'page':
                row.replaceWith((drawPageRow)(response));
                break;
              case 'article':
                row.replaceWith((drawPostRow)(response));
                break;
              case 'element':
                row.replaceWith((drawElementRow)(response))
                break;
            }
          });
        });

        $('.page-manager.editmode').on('change', '.main-table [data-field=redirect] input', function(event) {
          if (event.target.validity.valid) {
            var row = $(event.target).closest('tr');
            var pageId = row.data('id');
            var title = $(event.target).prop('value');
            row.removeClass('invalid');
            changePageRedirect(pageId, title).success(function(response) {
              row.replaceWith(drawPageRow(response))
            });
          } else {
            $(event.target).closest('td').addClass('invalid');
            setTimeout(function(){$(event.target).focus();},0);
          }
        });

        $('.page-manager.editmode').on('change', '.main-table [data-field=name] input', function(event) {
          var row = $(event.target).closest('tr');
          var pageId = row.data('id');
          var name = $(event.target).prop('value');
          var type = row.data('type');

          changePageName(pageId, name, type).success(function(response) {
            switch (type) {
              case 'page':
                row.replaceWith((drawPageRow)(response));
                break;
              case 'article':
                row.replaceWith((drawPostRow)(response));
                break;
              case 'element':
                row.replaceWith((drawElementRow)(response))
                break;
            }
          });
          if (!row.data('root')) {
            row.find('[data-field=title] span.title').text(name);
          }
        });

        $('.page-manager.editmode').on('change', '.main-table [data-field=description] textarea', function(event) {
          var row = $(event.target).closest('tr');
          var pageId = row.data('id');
          var description = $(event.target).prop('value');
          var type = row.data('type');

          changePageDescription(pageId, description, type).success(function(response) {
            switch (type) {
              case 'page':
                row.replaceWith((drawPageRow)(response));
                break;
              case 'article':
                row.replaceWith((drawPostRow)(response));
                break;
              case 'element':
                row.replaceWith((drawElementRow)(response))
                break;
            }
          });
        });

        $('.page-manager.editmode').on('change', '.main-table [data-field=url] input', function(event) {
          var row = $(event.target).closest('tr');
          var pageId = row.data('id');
          var slug = $(event.target).prop('value');
          var type = row.data('type');

          changePageSlug(pageId, slug, type).success(function(response) {
            switch (type) {
              case 'page':
                row.replaceWith((drawPageRow)(response));
                break;
              case 'article':
                row.replaceWith((drawPostRow)(response));
                break;
              case 'element':
                row.replaceWith((drawElementRow)(response))
                break;
            }
          });
        });

        $('.page-manager.editmode').on('click', '.main-table [data-field=name] .ico-eye', function(event) {
          $(event.target).closest('td').toggleClass('hidden');
          var row = $(event.target).closest('tr');
          var pageId = $(event.target).closest('tr').data('id');
          var hidden = $(event.target).closest('td').hasClass('hidden');
          var type = $(event.target).closest('tr').data('type');

          changePageHidden(pageId, hidden, type).success(function(response) {
            switch (type) {
              case 'page':
                row.replaceWith((drawPageRow)(response));
                break;
              case 'article':
                row.replaceWith((drawPostRow)(response));
                break;
              case 'element':
                row.replaceWith((drawElementRow)(response));
                break;
            }
          });
          if (hidden) {
            $(event.target).prop('title', 'This page is hidden from menus');
          } else {
            $(event.target).prop('title', '');
          }
        });

        $('.page-manager.editmode').on('change', '.main-table input, .main-table textarea', function(event) {
          updateCharcount($(event.target).closest('tr'));
        });

        var changePageHidden = function changePageHidden(id, hidden, type) {
          var data;

          switch (type) {
            case 'page':
              data = {page: { hidden: hidden }};
              break;
            case 'article':
              data = {article: { published: !hidden }};
              break;
            case 'element':
              data = {element: { values: {hidden: hidden} }};
              break;
          }

          return $.ajax({url: '/admin/api/' + type + 's/' + id, data: data, dataType: 'json', type: 'PUT'});
        };

        var changePageTitle = function changePageTitle(id, title, type) {
          var data;

          switch (type) {
            case 'page':
              data = {page: {data: {custom_title: title} }};
              break;
            case 'article':
              data = {article: {data: {custom_title: title} }};
              break;
            case 'element':
              data = {element: {values: {custom_title: title} }};
              break;
          }

          return $.ajax({url: '/admin/api/' + type + 's/' + id, data: data, dataType: 'json', type: 'PUT'});
        };

        var changePageName = function changePageName(id, name, type) {
          var data;

          switch (type) {
            case 'page':
              data = {page: { title: name }};
              break;
            case 'article':
              data = {article: { autosaved_title: name }};
              break;
            case 'element':
              data = {element: { title: name }};
              break;
          }

          return $.ajax({url: '/admin/api/' + type + 's/' + id, data: data, dataType: 'json', type: 'PUT'});
        };

        var changePageDescription = function changePageDescription(id, description, type) {
          var data;

          switch (type) {
            case 'page':
              data = {page: { description: description }};
              break;
            case 'article':
              data = {article: { description: description }};
              break;
            case 'element':
              data = {element: { values: {description: description} }};
              break;
          }

          return $.ajax({url: '/admin/api/' + type + 's/' + id, data: data, dataType: 'json', type: 'PUT'});
        };

        var changePageSlug = function changePageSlug(id, slug, type) {
          var data;

          switch (type) {
            case 'page':
              data = {page: { slug: slug }};
              break;
            case 'article':
              data = {article: { slug: slug }};
              break;
            case 'element':
              data = {element: { path: slug }};
              break;
          }

          return $.ajax({url: '/admin/api/' + type + 's/' + id, data: data, dataType: 'json', type: 'PUT'});
        };

        var changePageRedirect = function changePageRedirect(id, redirect_url) {
          return $.ajax({url: '/admin/api/pages/' + id, data: {page: { permanent_redirect_url: redirect_url }}, dataType: 'json', type: 'PUT'});
        };

        $('.page-manager.editmode').on('change', '.filters select', function(event) {
          $('.table-container').addClass('loading');
          setTimeout(function(){applyFilters();});
        });

        var applyFilters = function applyFilters() {
          var typeFilter = $('#page-types').val();
          var titleFilter = $('#page-titles').val();
          var redirectFilter = $('#page-redirect').val();

          var rows = $('.main-table tbody tr');
          $.each(rows, function(i, row) {
            var row = $(row);
            var show = true;
            switch (typeFilter) {
              case 'post':
                if (row.data('type') != 'post') {
                  show = false;
                }
                break;
              case 'page':
                if (row.data('type') != 'page') {
                  show = false;
                }
                break;
              case 'element':
                if (row.data('type') != 'element') {
                  show = false;
                }
                break;
            }

            switch (titleFilter) {
              case 'default':
                if (row.find('[data-field=title]').hasClass('custom')) {
                  show = false;
                }
                break;
              case 'custom':
                if (row.find('[data-field=title]').hasClass('default')) {
                  show = false;
                }
                break;
            }

            switch (redirectFilter) {
              case 'normal':
                if (row.find('[data-field=redirect]').hasClass('custom')) {
                  show = false;
                }
                break;
              case 'redirected':
                if (row.find('[data-field=redirect]').hasClass('default')) {
                  show = false;
                }
                break;
            }

            if (show) {
              row.addClass('visible');
            } else {
              row.removeClass('visible');
            }
            $('.table-container').removeClass('loading');
          });
        };

      })(Edicy.jQuery);
    </script>
  {% endeditorjsblock %}
  {% endif %}
</body>
</html>
