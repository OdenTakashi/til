#引数
    # *args
        def splatter(*args)
            p args
        end

        splatter('foo') #=> ['foo']

        splatter('foo', 'bar', 'baz') #=> ['foo', 'bar', 'baz']

        def math_consts(name, value)
            "#{name} = #{value}"
        end

        constants = [["π", 3.141592653589793], ["e", 2.718281828459045]]

        constants.each do |constant|
            puts math_consts(*constant)
        end

        #=> π = 3.141592653589793
        #=> e = 2.718281828459045

    # **opts
        def hello_with_option(msg, **opts)
            name = opts[:name]
            time = opts[:time] || Time.now
            puts "#{msg} #{name}@#{time}"
        end

        hello_with_option("Hello!", name: "odentakashi")
        # => Hello! odentakashi@2021-12-08 20:05:56.618653 +0900

        #デフォルト引数で空ハッシュ opts = {} を設定しても同じことになる
        def hello_with_option(msg, opts　= {})
            name = opts[:name]
            time = opts[:time] || Time.now
            puts "#{msg} #{name}@#{time}"
        end
        # => Hello! odentakashi@2021-12-08 20:05:56.618653 +0900

    # &block
