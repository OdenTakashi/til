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