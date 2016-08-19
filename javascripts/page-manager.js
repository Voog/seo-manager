(function($) {
  'use strict';

  var updateCharcount = function updateCharcount(row) {
    var $row = $(row),
        titleCC = $row.find('[data-field=title] .charcount'),
        descCC = $row.find('[data-field=description] .charcount');
    if ($row.find('[data-field=title]').hasClass('default')) {
      var count = $row.find('[data-field=title] .title').text().length;
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
      template.find('[data-field=url]').html('/');
    } else {
      template.find('[data-field=url] .prefix').text(getPageParentPath(page));
      template.find('[data-field=url] .path input').prop('value', page.slug);
    }

    template.find('[data-field=name] input').prop('value', page.title);

    if (page.hidden) {
      template.find('[data-field=name]').addClass('hidden');
      template.find('[data-field=name] .ico-eye').prop('title', 'This page is hidden from menus');
    }

    if (page.root) {
      var titleSuffix = $('body').data('root-title');
      template.find('[data-field=title] .default-value span.title-suffix').text(titleSuffix);
    } else {
      var titleSuffix = " | " + $('body').data('site-title');
      template.find('[data-field=title] .default-value span.title').text(page.title);
      template.find('[data-field=title] .default-value span.title-suffix').text(titleSuffix);
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
    $('.page-manager .main-table tbody').append(template);
    updateCharcount(template);
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
    template.find('[data-field=name] input').remove();
    template.find('[data-field=name]').html('&mdash;');
    var titleSuffix = " | " + $('body').data('site-title');
    template.find('[data-field=title] .default-value span.title').text(post.title);
    template.find('[data-field=title] .default-value span.title-suffix').text(titleSuffix);
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
    $('.page-manager .main-table tbody').append(template);
    updateCharcount(template);
  };

  var fetchPages = function fetchPages() {
    var base_url = '/admin/api/pages?s=path&per_page=250';
    $.get(base_url).success(function(response, status, xhr) {
      $('.table-container').addClass('loading');
      for (var i = 0; i < response.length; i += 1) {
        drawPageRow(response[i]);
        if (response[i].content_type === 'blog') {
          $.get(response[i].articles_url).success(function(response, status, xhr) {
            $('.table-container').addClass('loading');
            for (var i = 0; i < response.length; i += 1) {
              drawPostRow(response[i]);
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
              drawPageRow(response[i]);
              if (response[i].content_type === 'blog') {
                $.get(response[i].articles_url).success(function(response, status, xhr) {
                  $('.table-container').addClass('loading');
                  for (var i = 0; i < response.length; i += 1) {
                    drawPostRow(response[i]);
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
    var title = $(event.target).closest('td').find('.default-value .title').text();
    var suffix = $(event.target).closest('td').find('.default-value .title-suffix').text();
    link.closest('td').removeClass('default').addClass('custom').find('input').focus().val([title, suffix].join(''));
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
    console.log("clear redirect!");
    event.preventDefault();
    var link = $(event.target);
    link.prev().prop('value', '').trigger('change');
    link.closest('td').removeClass('custom invalid').addClass('default');
  });

  $('.page-manager.editmode').on('change', '.main-table td input, .main-table td textarea', function(event) {
    updateCharcount($(event.target).closest('tr'));
  });

  $('.page-manager.editmode').on('change', '.main-table [data-field=title] input', function(event) {
    var pageId = $(event.target).closest('tr').data('id');
    var title = $(event.target).prop('value');
    var type = $(event.target).closest('tr').data('type') === 'page' ? 'pages' : 'articles';
    changePageTitle(pageId, title, type);

  });

  $('.page-manager.editmode').on('change', '.main-table [data-field=redirect] input', function(event) {
    if ($(event.target).is(':valid')) {
      var pageId = $(event.target).closest('tr').data('id');
      var title = $(event.target).prop('value');
      $(event.target).closest('td').removeClass('invalid');
      changePageRedirect(pageId, title);
    } else {
      $(event.target).closest('td').addClass('invalid');
      setTimeout(function(){$(event.target).focus();},0);
    }
  });

  $('.page-manager.editmode').on('change', '.main-table [data-field=name] input', function(event) {
    var pageId = $(event.target).closest('tr').data('id');
    var name = $(event.target).prop('value');
    var type = $(event.target).closest('tr').data('type') === 'page' ? 'pages' : 'articles';
    changePageName(pageId, name, type);
    if (!$(event.target).closest('tr').data('root')) {
      $(event.target).closest('tr').find('[data-field=title] span.title').text(name);
    }
  });

  $('.page-manager.editmode').on('change', '.main-table [data-field=url] input', function(event) {
    var pageId = $(event.target).closest('tr').data('id');
    var slug = $(event.target).prop('value');
    var type = $(event.target).closest('tr').data('type') === 'page' ? 'pages' : 'articles';
    changePageSlug(pageId, slug, type);
  });

  $('.page-manager.editmode').on('click', '.main-table [data-field=name] .ico-eye', function(event) {
    $(event.target).closest('td').toggleClass('hidden');
    var pageId = $(event.target).closest('tr').data('id');
    var hidden = $(event.target).closest('td').hasClass('hidden');
    var type = $(event.target).closest('tr').data('type') === 'page' ? 'pages' : 'articles';
    changePageHidden(pageId, hidden, type);
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
    $.ajax({url: '/admin/api/' + type + '/' + id, data: {page: { hidden: hidden }}, dataType: 'json', type: 'PUT'});
  };

  var changePageTitle = function changePageTitle(id, title, type) {
    $.ajax({url: '/admin/api/' + type + '/' + id + '/data/custom_title', data: {value: title }, dataType: 'json', type: 'PUT'});
  };

  var changePageName = function changePageName(id, name, type) {
    $.ajax({url: '/admin/api/' + type + '/' + id, data: {page: { title: name }}, dataType: 'json', type: 'PUT'});
  };

  var changePageSlug = function changePageName(id, slug, type) {
    $.ajax({url: '/admin/api/' + type + '/' + id, data: {page: { slug: slug }}, dataType: 'json', type: 'PUT'});
  };

  var changePageRedirect = function changePageRedirect(id, redirect_url) {
    $.ajax({url: '/admin/api/pages/' + id, data: {page: { permanent_redirect_url: redirect_url }}, dataType: 'json', type: 'PUT'});
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

})(jQuery);
