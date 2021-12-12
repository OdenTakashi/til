# 条件式 ? 真の時の値 : 偽の時の値
result = 80
flag = result > 60 ? "合格" : "不合格"

# 演算子
# <=>
# 左辺の方が大きかったら１、小さかったら-1
# 自作クラスで比較演算したい場合、Comparable モジュールをクラスにインクルードし、<=> 演算子を定義することで可能g
10 <=> 11 # -1

# eval
eval('def hoge; p "Hello World" end')
hoge 
#=> Hello World

# define_method
{hoga: 1, hoge: 2}.each do |name, value|
    define_method name do 
        p value
    end
end
hoga #=> 1
hoge #=> 2