# メソッドはオブジェクトではないので変数に代入不可
def square(n)
    n * n
end

sq = square #=> ArgumentError (wrong number of arguments (given 0, expected 1))

# 引数渡しの際も同じ
def square(n)
    n * n
end

def print_func(args, fun)
    puts fun(args)
end

print_func(4, square) #=> ArgumentError (wrong number of arguments (given 0, expected 1))

# メソッドをオブジェクト化させる
sq = method(:square) #=> #<Method: main.square(n) (irb):1>

# オブジェクト化させたメソッドの呼び出し
sq(4) #=> NoMethodError (undefined method `sq' for main:Object)

sq.call(4) #=> 16
sq[3] #=> 9
sq.(3) #=> 9

# ブロックを引数として渡す
def print_func(arg, &fun)
    puts fun.call(arg)
end

print_func(4) {|n| n * n} #=> 16

def print_func(arg, &fun)
    puts yield(arg)
end

print_func(4) {|n| n * n} #=> 16

#ブロックをオブジェクト化する
lambda{|n| n * n}
proc {|n| n * n}
Proc.new {|n| n * n}
->n {|n| n * n}

square = ->n {|n| n * n}
square.call(3) #=> 9

def print_func(arg, fun)
    puts fun.call(arg)
end

print_func(4, square) #=> 16

# &にブロックが渡されるとProcオブジェクトに変更される
def print_func(arg, &fun)
    puts fun.class
end

print_func(4) {|n| n * n} #=> >>Proc

%w(charlie liz george).map(&:capitalize) # => ["Charlie", "Liz", "George"]
# &にオブジェクトが代入される時に `to_proc`が呼ばれる

#sendメソッド
obj = ->obj{obj.send(:send)} #<Proc:0x00007fde1912cc40 (irb):8 (lambda)>

# define_method
%w(a b c).each do |name|
    define_method(name) do 
        puts "Hello"
    end
end

a #=> Hello
b #=> Hello
c #=> Hello