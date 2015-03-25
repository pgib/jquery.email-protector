# jQuery email protector plug-in
#
# https://github.com/pgib/jquery.email-protector/
#
# This plugin will allow you to keep your mailto: links away from the
# prying eyes of email harvester bots. Instead of having:
#
# <a href="mailto:foo@bar.com">foo@bar.com</a>
#
# You would simply have:
#
# <a data-email-protector="foo|bar.com"></a>
#
# If you want to use alternate text for the link, do it like this:
#
# <a data-email-protector="foo|bar.com" data-email-protector-preserve-text="true">email me!</a>
#
# To activate it, you could do:
#
# <script type="text/javascript">
#   $("a[data-email-protector]").emailProtector()
# </script>
#
# If you always want to preserve the text inside the link, you can pass in an option:
#
# <script type="text/javascript">
#   $("a[data-email-protector]").emailProtector({ 'preserve-text': true })
# </script>
#
$ = jQuery
$.fn.extend
  emailProtector: (options) ->
    settings =
      'preserve-text': false

    settings = $.extend settings, options

    return @each ->
      el = $(@)
      parts = el.attr('data-email-protector').split('|')
      preserveText = if el.attr('data-email-protector-preserve-text') then el.attr('data-email-protector-preserve-text') != 'false' else settings['preserve-text']

      if parts.length == 2
        if queryMatch = parts[1].match(/(\?.+)/)
          query = queryMatch[1]
          parts[1] = parts[1].substring(0, parts[1].indexOf('?'))
        el.text "#{parts[0]}@#{parts[1]}" unless preserveText
        el.attr 'href', "mailto:#{parts[0]}@#{parts[1]}#{query ? ''}"
      else
        el.text "Invalid format. eg. <a data-email-protector=\"foo|bar.com\"></a> will become <a href=\"mailto:foo@bar.com\"></a>."

