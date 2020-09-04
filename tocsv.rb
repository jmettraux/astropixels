
require 'time'


YEAR_REX = /-?\d{1,4}/
QUARTER_REX = /([A-Z][a-z]{2})\s+(\d{1,2})\s+(\d\d):(\d\d)/
ECLIPSE_REX = /[TAHPtpn]/

MONTHS = [ nil,
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
  'Sep', 'Oct', 'Nov', 'Dec' ]


def parse_quarter(y, s)

  m = s.match(QUARTER_REX)
  return nil unless m

  Time
    .gm(y, MONTHS.index(m[1]), m[2].to_i, m[3].to_i, m[4].to_i)
    .strftime('%F %H:%M')
end


lines = File.readlines('astropixels_moon_phases.txt')

File.open('astropixels_moon_phases.csv', 'wb') do |f|

  f.puts('New Moon,E,First Quarter,Full Moon,E,Last Quarter')

  year = nil
  row = [ '', ' ', '', '', ' ', '' ]

  lines.each_with_index do |line, li|

    next if line.match(/\sYear\s/)

    #f.puts('New Moon,E,First Quarter,Full Moon,E,Last Quarter')
#p line

    syear = line[0, 7] || ''
    year = syear.to_i if syear.match(/\d/)

    snmoon = line[8, 14] || ''
    nmoon = parse_quarter(year, snmoon)
    row[0] = nmoon if nmoon

    snme = line[22, 1] || ' '; snme = ' ' if snme == ''
    row[1] = snme if nmoon

    sfquarter = line[26, 14] || ''
    fquarter = parse_quarter(year, sfquarter)
    row[2] = fquarter if fquarter

    sfmoon = line[44, 14] || ''
    fmoon = parse_quarter(year, sfmoon)
    row[3] = fmoon if fmoon

    sfme = line[58, 1] || ' '; sfme = ' ' if sfme == ''
    row[4] = sfme if fmoon

    slquarter = line[62, 14] || ''
    lquarter = parse_quarter(year, slquarter)
    row[5] = lquarter if lquarter

    srow = row.join(',')
    next if srow.match(/,$/)

    f.puts(srow)
    row = [ '', ' ', '', '', ' ', '' ]
  end
end

