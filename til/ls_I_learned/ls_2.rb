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

# tapメソッド
# デバックをするのが主な利用手段
# レシーバーを返す

(1..10).to_a.tap{|x| puts "Array: #{x}"}
#=> Array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
[40, 30, 10, 30, 50]
  .sort
	.tap{|array| p array}
  .reverse
  .tap{|array| p array}

	# [10, 30, 30, 40, 50]
  #	[50, 40, 30, 30, 10]

# breakを使うと戻り値をブロック内の処理に変えることができる。
a = [ 1, 2, 3, 4, 5 ]
b = true

a.tap{ |v| break v.reverse if b }
#=> [5, 4, 3, 2, 1]

# yield_self(then)
3.next.then {|x| x**x }.to_s             # => "256"
"my string".yield_self {|s| s.upcase }   # => "MY STRING"
