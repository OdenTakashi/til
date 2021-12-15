# OptionParser
require 'optparse'

opt = OptionParser.new
opt.on('-a') { |v| p v }
opt.parse!(ARGV)
p ARGV

ruby sample.rb -a foo bar
#=> true
#=> ["foo", "bar"]