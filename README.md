jquery.email-protector
======================

Simple jQuery plug-in to make it harder for spam bots to harvest email addresses

Usage:

    <a data-email-protector="foo|bar.com">...</a>

Once your document is ready, simply call the plug-in on these links:

    $("a[data-email-protector]").emailProtector()

The link will be displayed as `foo@bar.com`. If you wish to preserve your link
text, do it like this:

    <a data-email-protector="foo|bar.com" data-email-protector-preserve-text="true">Contact us!</a>

Or, globally:

  $("a[data-email-protector]").emailProtector({ 'preserve-text': true })

Boom! You're done.

