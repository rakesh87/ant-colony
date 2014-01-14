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

def time_cost_quality_changed_pheromone(q, value_of_objective)
	q.to_f/(3*value_of_objective.to_f)
end

def risk_changed_pheromone(time, risk)
	1.0/value_of_objective(time.to_f, risk.to_f)
end

def value_of_objective(time, risk)
	((time/10)**risk)/0.25
end
