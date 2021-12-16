# OptionParser
require 'optparse'

opt = OptionParser.new
opt.on('-a') { |v| p v }
opt.parse!(ARGV)
p ARGV

ruby sample.rb -a foo bar
#=> true
#=> ["foo", "bar"]

# onメソッド
# 引数が指定された時の処理をブロックで記述します。ブロックの引数にはオプションが指定されたことを示す true が渡されます
opt.on('-a') { |v| p v }

# into
require 'optparse'

params = {}
opt = OptionParser.new
opt.on('-a') { |v|  v }
opt.parse!(ARGV, into: params)
p params

ruby sample.rb -a 
# {a: true}

# Dir.glob
# 第2引数のデフォルト値は0になっている

# 変数の出自がわかるようにする
