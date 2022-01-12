# %の後に()を使っているが、他の記号でも問題ない(`{}`, `||`, `[]`)

# %, %Q
# ダブルクオートで囲うのと同様、変数展開も可能
str = %( Programming language Ruby )
puts str 
#=> Programming language Ruby 

ruby = "Ruby"
str = %Q( Programmig language #{ruby} )
puts str
#=> Programmig language Ruby 

# %q
# シングルクオーとで囲うのと同様、変数展開は不可能
ruby = "Ruby"
str = %q( Programming language "#{ruby}")
puts str
#=> Programming language "#{ruby}"

# %w
# 配列を作る
# 四季の展開はされない、スペース区切りで要素を指定
array = %w(one two three four)
p array 
#=> ["one", "two", "three", "four"]

# %W
# 式展開される
ruby = 'Ruby'
array = %W( #{ruby} Python)
p array
#=> ["Ruby", "Python"]

# %i
# 要素がシンボルの配列を作る
# 式展開されない
array = %i(Ruby Python PHP)
p array
#=> [:Ruby, :Python, :PHP]

# %I
# 式展開される
ruby = 'Ruby'
python = 'Python'
array = %I( #{ruby} #{python} )
p array
#=> [:Ruby, :Python]

# %x
# コマンド出力を行う
res = %x(date) # dateコマンドの実行
puts res
#=> "2021年 12月20日 月曜日 21時22分35秒 JST\n"

# %s
sym = %s(Ruby)
p sym
#=> :Ruby

# `&.` について
# レシーバがnilではない場合にメソッドを呼び出す
a = nil
a&.to_s
#=> nil

# breakについて
ブロック内でbreakに引数を与えるとその引数が戻り値になる

