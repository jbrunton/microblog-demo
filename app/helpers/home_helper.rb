module HomeHelper
  def lang_link(locale)
    link_to t('lang.name', :locale => locale), :locale => locale
  end
  
  def lang_list_item(locale)
    link = lang_link(locale)
    if locale == I18n.locale
      "<dd class='active'>#{link}</dd>"
    else
      "<dd>#{link}</dd>"
    end
  end
  
  def lang_selector
    items = [:en, :es, :fr].
      map { |locale| lang_list_item(locale) }.
      join
    "<dl class='sub-nav'><dt>#{t('lang.language')}:</dt>#{items}".
      html_safe
  end
end
