stat = File::Stat.new($0)
# puts stat.mtime.to_s.slice!(6..15)
# p stat.mode.to_s(8)
# -rw-r--r--
# 100644
#=> 1-12 12:05
#=> 1-20 14:54

# puts stat.mtime
#=> 2022-01-12 12:05:48 +0900
# この情報を月日、時間（分まで）にするためにslice(6..15)を指定した

require 'etc'

user_id    = Process.uid
user_name  = Etc.getpwuid(user_id).name
group_id   = Process.gid
group_name = Etc.getgrgid(group_id).name

puts "#{stat.mode.to_s(8)} #{stat.nlink} #{user_name} #{group_name}  #{File.size('ls_4.rb')} #{stat.mtime.to_s.slice!(6..15)}"

#=> kodamanaoki
#=> staff

# 全てのプロセスにはプロセスIDというものが存在している
