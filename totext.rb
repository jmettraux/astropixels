
require 'nokogiri'

File.open('astropixels_moon_phases.txt', 'wb') do |f|

  Dir['html/*.html']
    .sort_by { |pa|
      pa.match(/(-?\d+)/)[1].to_i }
    .each { |path|
      puts path
      s = File.read(path).gsub(/\r/, "\n")
      doc = Nokogiri::HTML(s)

      doc.css('pre').each do |x|
        #puts x.name
        # Nokogiri::XML::Text
        x.children
          .select { |e| e.is_a?(Nokogiri::XML::Text) }
          .each { |e| f.write(e.to_s) }
      end }
end

