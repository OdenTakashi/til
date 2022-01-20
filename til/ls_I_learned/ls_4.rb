stat = File::Stat.new(filename)
puts stat.mtime.to_s.slice!(6..15)

#=> 1-12 12:05
#=> 1-20 14:54

puts stat.mtime
#=> 2022-01-12 12:05:48 +0900
# この情報を月日、時間（分まで）にするためにslice(6..15)を指定した
