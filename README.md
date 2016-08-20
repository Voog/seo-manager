# Voog SEO tool

This is a custom Voog layout to help with managing all your site's pages and (some of) their SEO-critical attributes.

![example](screenshots/basic.png)

Currently it allows changing the following attributes for pages and blog posts:

* path
* name/title (shown in menu)
* title (used for &lt;title&gt; tag)
* visibility / published status
* description
* permanent redirect (for pages only)

By default, the 'custom_title' component defines the title prefix and suffix as blank strings, so be default the title is always shown as defined. The prefix and suffix can be used to append common elements to the existing title, e.g "Home page | MyCompany" instead of just "Home page".

The tool should be pretty simple to tweak as it's just a simple HTML+Liquid template with CSS and JS both included inside the layout itself.
To give feedback or report bugs, you can use the Github issue tracker or contact me at <a href="mailto:mikk@voog.com">mikk@voog.com</a>
