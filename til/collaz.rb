# ある自然数n（0でない）に対して以下を繰り返す。
# * 奇数だったら3倍して1足す
# * 偶数だったら2で割る
# 
# 例： 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

def calc(n)
    result = n.even? ? (n / 2) : (n * 3 + 1)
    return result
end

x = calc(ARGV[0].to_i)

while x != 1
    puts x
    x = calc(x)
end
