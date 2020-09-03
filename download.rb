
require 'open-uri'

# http://astropixels.com/ephemeris/phasescat/phases-1999.html
# ...
# http://astropixels.com/ephemeris/phasescat/phases-0199.html
# http://astropixels.com/ephemeris/phasescat/phases-0099.html

# http://astropixels.com/ephemeris/phasescat/phases0001.html
# http://astropixels.com/ephemeris/phasescat/phases0101.html
# ...
# http://astropixels.com/ephemeris/phasescat/phases3901.html


#i = 1
#while i < 3902
#  open("http://astropixels.com/ephemeris/phasescat/phases%04d.html" % i) do |h|
#    File.open("html/phase%04d.html" % i, 'wb') { |f| f.write(h.read) }
#  end
#  i = i + 100
#end

i = -1999
while i < 0
  open("http://astropixels.com/ephemeris/phasescat/phases%05d.html" % i) do |h|
    File.open("html/phase%04d.html" % i, 'wb') { |f| f.write(h.read) }
  end
  i = i + 100
end

