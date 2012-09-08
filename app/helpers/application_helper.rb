module ApplicationHelper

  # @author John Brown
  # Converts Markdown text to HTML.
  #
  # @param [String] Markdown
  #
  # @return [String] HTML
  #
  def markdown(text)
    Markdown.render(text).html_safe
  end

end
