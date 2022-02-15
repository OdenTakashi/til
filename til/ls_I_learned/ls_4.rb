stat = File::Stat.new("#{File.expand_path("lib")}")
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

puts "#{stat.mode.to_s(8)} #{stat.nlink} #{user_name} #{group_name}  #{stat.mtime.to_s.slice!(6..15)}"

#=> kodamanaoki
#=> staff

# 全てのプロセスにはプロセスIDというものが存在している
p File.expand_path("lib")

MAX_COLUMN_LENGTH = 3

require 'etc'

def ls_main(filesnames)
  fulfilled_filesnames = complete_filesnames(filesnames)
  grouped_filesnames = fulfilled_filesnames.each_slice(get_max_line_length(filesnames)).to_a
  transposed_filesnames = grouped_filesnames.transpose
  output(transposed_filesnames)
end

def complete_filesnames(filesnames)
  count_files_mod_by_three = filesnames.count % MAX_COLUMN_LENGTH
  where_add_nil = locate_nil(filesnames)
  add_nil(where_add_nil, filesnames, count_files_mod_by_three)
end

def locate_nil(filesnames)
  max_line_length = get_max_line_length(filesnames)
  { the_end_of_second_column_index: (max_line_length * 2).pred,
    the_end_of_third_column_index: (max_line_length * 3).pred }
end

def get_max_line_length(filesnames)
  count_files = filesnames.count
  count_files_mod_by_three = filesnames.count % MAX_COLUMN_LENGTH
  if count_files_mod_by_three.zero?
    count_files / MAX_COLUMN_LENGTH
  else
    (count_files / MAX_COLUMN_LENGTH).next
  end
end

def add_nil(where_add_nil, filesnames, count_files_mod_by_three)
  case count_files_mod_by_three
  when 1
    filesnames.insert(where_add_nil[:the_end_of_second_column_index], nil)
    filesnames.insert(where_add_nil[:the_end_of_third_column_index], nil)
  when 2
    filesnames.insert(where_add_nil[:the_end_of_third_column_index], nil)
  else
    filesnames
  end
  filesnames
end

def output(transposed_filesnames)
  transposed_filesnames.each do |file_line|
    puts file_line.compact.join('  ')
  end
end

def main
  directory_names = ARGV.empty? ? [Dir.pwd] : ARGV
  # directory_names = ['../']
  directory_names.each do |directory|
    # directory = '../'
    puts directory if directory_names.count > 1
    filesnames = Dir.glob('*', base: directory)
    filesnames.each do |filename|
      user_id    = Process.uid
      user_name  = Etc.getpwuid(user_id).name
      group_id   = Process.gid
      group_name = Etc.getgrgid(group_id).name
      # filename = 'lib'
      # file_name = 'lib', directory = '../' = # directory  = ./ == /Users/kodamanaoki/ruby-practices/05.ls/
      # /Users/kodamanaoki/ruby-practices/05.ls/lib 
      # directory = /Users/kodamanaoki/ruby-practices/05.ls/lib
      file_path = File.expand_path(filename, directory)
      # directory  = ./ == /Users/kodamanaoki/ruby-practices/05.ls/lib
      # /Users/kodamanaoki/ruby-practices/05.ls/lib/lib
      stat = File::Stat.new(file_path)
      puts "#{stat.mode.to_s(8)} #{stat.nlink} #{user_name} #{group_name}  #{File.size(file_path)} #{stat.mtime.to_s.slice!(6..15)} #{filename} "
    end
    # ls_main(filesnames)
  end
end

main

#File::statの際に絶対パスじゃないと見つけてくれない
#File.expand_path(path)で絶対パスへの変換を試みた
#現在のディレクトリが基準となった絶対パスが指定されてしまう。。