module ApplicationHelper

  # @author John Brown
  # Returns an html5 <time> tag ready for jquery.timeago
  #
  # @param [Object] time
  #
  # @return [String] HTML5 <time> tag with UTC date
  #
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:time, time.to_s, options.merge(:datetime => time.getutc.iso8601)) if time
  end   

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
