KEY_NUMBER = 2

target_number = gets.to_i

remainder = []

while target_number != 0
	remainder.push(target_number % KEY_NUMBER)
	target_number = target_number / KEY_NUMBER
end
p remainder.reverse.join