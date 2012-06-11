module PagesHelper

  def page_title
    default = "Convenient Articles"
    if @page_title.nil?
      "#{default}"
    else
      "#{default} | #{@page_title}"
    end
  end
end
