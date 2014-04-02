$ = jQuery
$.fn.extend
  emailProtector: (options) ->
    return @each ->
      el = $(@)
      parts = el.attr('data-email-protector').split('|')

      if parts.length == 2
        if queryMatch = parts[1].match(/(\?.+)/)
          query = queryMatch[1]
          parts[1] = parts[1].substring(0, parts[1].indexOf('?'))
        el.text "#{parts[0]}@#{parts[1]}" unless el.attr('data-email-protector-preserve-text')
        el.attr 'href', "mailto:#{parts[0]}@#{parts[1]}#{query ? ''}"
      else
        el.text "Invalid format. eg. <a data-email-protector=\"foo|bar.com\"></a> will become <a href=\"mailto:foo@bar.com\"></a>."

