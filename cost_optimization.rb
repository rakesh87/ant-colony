def get_inputs
	puts "Please provide First input as duration(day)"
	input1 = gets.chomp
	puts "Please provide Second input as cost($)"
	input2 = gets.chomp
	puts "Please provide Third input as resources(manpower)"
	input3 = gets.chomp
	puts "Hey! we have got output : #{calculate_ouptput(input1, input2, input3)}"
end

def calculate_ouptput(a, b, c)
	a.to_i + b.to_i + c.to_i
end

get_inputs