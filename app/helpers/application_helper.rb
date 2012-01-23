module ApplicationHelper
  # Returns the full title page on a page by page basis.
  # If no page title is provided, a default title will be used
  def full_title(page_title) # Method definition
    base_title="MicroBlogger Sample Application"  #variable assignment
    if page_title.empty? #condition check for empty
      base_title #implicit method return call
    else #condition fails
      "#{base_title} | #{page_title}" #String interpolation (#{var name} inside quote places var value in string), implicit return.
    end
  end
end
