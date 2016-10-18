class HtmlBuilder

  def self.ul_from_array( array )
    html = "<ul>"
    array.each { |item| html += "<li>#{item}</li>" }
    return html
  end

  def self.table_for_data( data, sort_by=nil )

    columns = data.first().keys()

    if sort_by != nil
      data_array.sort! { |a, b| a[sort_by] <=> b[sort_by] }
    end

    html = ""
    html += "<table>"
      html += "<thead>"
        columns.each do |heading|
          html += "<th>#{heading}</th>"
        end
      html += "</thead>"
      data.each do |entry|
        html += "<tr>"
          columns.each do |column|
            html += "<td>"
              html += entry[column]
            html += "</td>"
          end
        html += "</tr>"
      end
    html += "</table>"

    return html
  end

end
