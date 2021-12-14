# 命名に関して
	# 命名に関してはこだわるべき
	# out_puts という英語はない気がするので、 output などちゃんとした英単語にしたほうがよい
	# gets_argument で出力までやっているのは名前とやっていることが違うかなーと思いますので考える
	# 何かの操作をするメソッドは単数形の動詞が多い
	# コメントで補足ができるだけ必要ないようなメソッド名
	# 何をしているのかわからない名前は一般的にアンチパターン
	# 詳細をしらなくてもなんとなくこんなことしていそう、ということがわかるような名前をつけるようにするとよい
	# そういった名前をつけづらい場合、メソッドの単位として適切ではない
	# 「nilを挿入して何をしたいのか？」を考えたほうがいい

# メソッドに関して
	# 一旦全体でやりたいことを言葉で書き出してみて、対応するように処理を書いていくとメソッドの整理がしやすい
	# 他のメソッドにわたしたい場合は一旦メソッドの返り値として返してみて
		def method
			やりたいこと = method_a
			次にやりたいこと = やりたいこと.method_b
			最終的にやりたいこと = 次にやりたいこと.method_c
		end
  # 同じ抽象度のメソッドは同じ階層になるように
		def method_a
		  method_a_1
		  method_a_2
		end

		def method_a_1
		  method_a_1_i
		  method_a_1_ii
		end
	# メソッドとして抽象化する利点としては、
	#処理を意味の単位で一個抽象的な処理としてまとめられる
	#タイプ数が減らせる
	#メソッドの中身の処理が変わってもメソッドの入出力が同じならメソッドを呼び出す側は変更が不要
	# 抽象的な概念ごとにわけるようにして
	# メソッドはできるだけひとつの言葉(動作)であらわす
	# 呼び出す度に結果がかわるものではないメソッドを何度も呼び出すのは基本的にあまりやらない
	# 瑣末なことなので、特にメソッド名にいれる必要はない
	# やりたいことを同レベルの抽象度でまずは日本語で書いてみるといい

# 変数に関して
	# 定数化させる必要がある変数はグローバルで使う必要のあるもの
	# グローバル変数は使うべきではない（よっぽどのことがない限り）
	# インスタンス変数はクラスのインスタンスの状態をあらわすのに使いますが、このようにクラス外で使うことは理由がない限りあまりやらない
	# ローカル変数は「モノ」をあらわすことが多いので、名詞を使うことが多い
	# 同じ処理を何回も行う場合はローカル変数として保持すべき
	# グローバルに使う数値などは定数として定義することが多い
	# globの結果ってArrayになると思うので、 filenames など複数形の変数名のほうがよさそう
	# グローバル変数はバグの元なので、よっぽど必要な理由がない限りは使わない
	# mainはこういった何かしらの処理をするスクリプトの最初に実行されるメソッド名としてよく使われるものなので、
	#プログラミングに慣れている人なら、ここがスタートなんだ、ということを察することができます。

# その他
	# このようなコードは
	case get_file.size % 3
	when 1
		2.times do
			get_file.push(nil)
		end
	when 2
		get_file.push(nil)
	end

	# このようにすべき
	(3 - get_file.size % 3).times do
	  get_file.push(nil)
	end
	