def get_inputs
	puts "Please provide First input as duration(day)"
	input1 = gets.chomp
	puts "Please provide Second input as cost($)"
	input2 = gets.chomp
	puts "Please provide Third input as resources(manpower)"
	input3 = gets.chomp
	puts "Hey! we have got output : #{calculate_ouptput(input1, input2, input3)}"
end

GLOBAL_EVAPORATION_RATE = 0.1

def setup_data(activity, resource_option, risk_duration_cost_quality_values)
	
end

def initial_pheromone(no_of_resource)
	1.0/no_of_resource
end

def time_changed_pheromone(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	10.0/(3*value_of_objective.to_f)
end

def cost_changed_pheromone(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	10000.0/(3*value_of_objective.to_f)
end

def quality_changed_pheromone(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	0.0005/(3*value_of_objective.to_f)
end

def risk_changed_pheromone(time, risk)
	1.0/value_of_objective(time.to_f, risk.to_f)
end

def value_of_objective(time, risk)
	((time/10)**risk)/0.25
end

def node_transition_rule(pheromone_intensity, value_of_objective, activity=7)
	neeta = 1.0/value_of_objective
	alpha = 1
	(pheromone_intensity ** alpha) * (neeta ** 0.01)/ #summation
end

def summation(k)
	(1..k).inject(0) {|sum, x| sum + 1.0 / x ** 2}
end

#global pheromone at time t for time
def time_global_pheromone_at_time(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	((1 - GLOBAL_EVAPORATION_RATE) * pheromone_at_t_minus_1) + time_changed_pheromone(value_of_objective)
end

#global pheromone at time t for cost
def cost_global_pheromone_at_time(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	((1 - GLOBAL_EVAPORATION_RATE) * pheromone_at_t_minus_1) + cost_changed_pheromone(value_of_objective)
end

#global pheromone at time t for quality
def quality_global_pheromone_at_time(value_of_objective)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	((1 - GLOBAL_EVAPORATION_RATE) * pheromone_at_t_minus_1) + quality_changed_pheromone(value_of_objective)
end

#global pheromone at time t for risk
def risk_global_pheromone_at_time(time, risk)
	# where q = [time=10, cost= 10_000, quality=0.0005]
	((1 - GLOBAL_EVAPORATION_RATE) * pheromone_at_t_minus_1) + risk_changed_pheromone(time, risk)
end