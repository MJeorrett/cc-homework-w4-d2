class HtmlBuilder

  def self.unordered_list_from_array( array )
    html = "<ul>"
    array.each { |item| html += "<li>#{item}</li>" }
    return html
  end

end
