#切り捨て
1.4.floor # 1
1.5.floor # 1
-1.4.floor # -2
-1.5.floor # -2

#桁数指定
require 'bigdecimal'

BigDecimal(1.23456.to_s).floor(2).to_f # 1.24
BigDecimal(1.23456.to_s).floor(3).to_f # 1.234

#切り上げ
1.4.ceil  # 2
1.5.ceil  # 2
-1.4.ceil # -1
-1.5.ceil # -1

#四捨五入
1.4.round # 1
1.5.round # 2
-1.4.round # -1
-1.5.round # -2

#四捨五入　桁指定
1.23456.round(2) # 1.23
1.23456.round(3) # 1.235
123456.round(-2) # 123500
123456.round(-3) # 123000