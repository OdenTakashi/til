#  ファイル内の行数、ワード数、およびバイト数
#  -l	行数をカウントします。 

# methodA
	# - ファイル内の行数 == method a1
	# -	ワード数 == method a2
	# -	およびバイト数 == method a3
	# ..の表示 

		# method a1
		# -	ファイル内の行数の数値の取得
		# method a2 
		# - ワード数の取得
		#	method a3
		# - およびバイト数の取得
		
# ディレクトリを指定した場合
# wc: ../: read: Is a directory
	#  0       0       0 total

#複数のファイルを指定した場合、
#指定したファイルの ファイル内の行数、ワード数、およびバイト数
#が表示される

#どうする？？
#一回目出力した結果をどこかに保持ておいて、2回目の出力結果を保持している
#ところにプラスする形にしたい。
#hashを使う
#hashの要素で行数、単語数、バイト数のhashの配列を作る

hash = [{lines: , words: , bytes: }, {lines: , words: , bytes: }, {lines: , words: , bytes: }]

def total_result(str, filename)
	ary = []
	hash = {lines: output_file_lines(str)} << ary
	hash = {words: output_words_count(str)} << ary
	hash = {bytes: output_bytes_values(filename)} << ary
end

#改行の出力とhashへの代入の繋ぎをどのようにすれば良いのだろうか？？

#やることをある程度まとめる
計算する
出力する

# -lを指定した時、改行とファイル名のみの出力にしたい

#if -l 
	# 1 filename
# else
	# 1 2 3 filename
	# end

# 標準入力から値を受け取れるようにすること

main
オプションの有無の判定
標準入力から情報を取得するのか引数のファイル名から情報を取得するのかの判定
ファイル名が複数の場合複数のファイルの合計値の出力への梯子
オプションがあるときの処理
引数が指定されず標準入力からの情報を得る場合の処理
出力

wc_main
与えられたファイル情報からそれぞれの値を取得する

count_lines
与えられたものの行数のカウント

count_words
与えられたものの文字数のカウント

count_bytes
与えられたもののバイト数のカウント

total_result
それぞれの領域の合計値のカウント

output
出力

mainメソッドの役割が多すぎるから分担したい！

## wcメソッド
- `main`メソッドはプログラムのエントリポイントが一つの時に使う（分岐がある場合に使うのは違和感がある）
- メソッドを回していく中での粒度を揃える
- そのメソッドで何がしたいのかを簡潔に表すメソッド名にする
- 変数名で何を表したいのか考えそれにあった命名をする