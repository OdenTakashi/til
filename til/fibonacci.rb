# 例: 1 1 2 3 5 8 13 21 

def fibonacci(n)
	fibonacci_array = Array.new
	fibonacci_array[0] = fibonacci_array[1] = 1
	for i in 2 .. n  do
		tmp = fibonacci_array[i - 1] + fibonacci_array[i - 2]
		binding.irb
		fibonacci_array.push(tmp)
	end

	puts fibonacci_array
end

n = gets.chomp("\n").to_i
fibonacci(n)