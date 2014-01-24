def prepare_time_data_input
	[
		{"11"=> 14},
		{"12"=> 20},
		{"13"=> 24}, 
		{"21"=> 15}, 
		{"22"=> 18}, 
		{"23"=> 20}, 
		{"24"=> 30}, 
		{"25"=> 60},
		{"31"=> 15},
		{"32"=> 22},
		{"33"=> 33},
		{"41"=> 12},
		{"42"=> 16},
		{"43"=> 20},
		{"51"=> 22},
		{"52"=> 24},
		{"53"=> 28},
		{"54"=> 30},
		{"61"=> 14},
		{"62"=> 18},
		{"63"=> 24},
		{"71"=> 9},
		{"72"=> 15},
		{"73"=> 18},
	]
end

def prepare_cost_data_input
	[
		{"11"=> 23000},
		{"12"=> 18000},
		{"13"=> 12000}, 
		{"21"=> 3000}, 
		{"22"=> 2400}, 
		{"23"=> 1800}, 
		{"24"=> 1200}, 
		{"25"=> 600},
		{"31"=> 4500},
		{"32"=> 4000},
		{"33"=> 3200},
		{"41"=> 45000},
		{"42"=> 35000},
		{"43"=> 30000},
		{"51"=> 20000},
		{"52"=> 17000},
		{"53"=> 15000},
		{"54"=> 10000},
		{"61"=> 40000},
		{"62"=> 32000},
		{"63"=> 18000},
		{"71"=> 30000},
		{"72"=> 24000},
		{"73"=> 22000},
	]
end

def prepare_quality_data_input
	[
		{"11"=> 97},
		{"12"=> 81},
		{"13"=> 82}, 
		{"21"=> 98}, 
		{"22"=> 92}, 
		{"23"=> 83}, 
		{"24"=> 76}, 
		{"25"=> 57},
		{"31"=> 96},
		{"32"=> 83},
		{"33"=> 52},
		{"41"=> 93},
		{"42"=> 77},
		{"43"=> 56},
		{"51"=> 99},
		{"52"=> 85},
		{"53"=> 76},
		{"54"=> 51},
		{"61"=> 97},
		{"62"=> 73},
		{"63"=> 54},
		{"71"=> 93},
		{"72"=> 78},
		{"73"=> 58},
	]
end

def prepare_risk_data_input
	[
		{"11"=> 0.10},
		{"12"=> 0.35},
		{"13"=> 0.35}, 
		{"21"=> 0.10}, 
		{"22"=> 0.20}, 
		{"23"=> 0.35}, 
		{"24"=> 0.45}, 
		{"25"=> 0.60},
		{"31"=> 0.10},
		{"32"=> 0.35},
		{"33"=> 0.60},
		{"41"=> 0.20},
		{"42"=> 0.45},
		{"43"=> 0.60},
		{"51"=> 0.10},
		{"52"=> 0.35},
		{"53"=> 0.45},
		{"54"=> 0.60},
		{"61"=> 0.10},
		{"62"=> 0.45},
		{"63"=> 0.60},
		{"71"=> 0.20},
		{"72"=> 0.45},
		{"73"=> 0.60},
	]
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

def calculation_for(data_input)
	keys = []
	values = []
	data_input.each do |path|
		keys << path.keys
		values << path.values
	end
	[keys.flatten!, values.flatten!]
	
end

def results_for_time(data_input)
	results = {}
	calculation_for(data_input).last.each_with_index do |val, index|
	  pheromone = time_changed_pheromone(val)
	  results.merge!(calculation_for(data_input).first[index] => pheromone)
	end
	results
end

def results_for_cost(data_input)
	results = {}
	calculation_for(data_input).last.each_with_index do |val, index|
	  pheromone = cost_changed_pheromone(val)
	  results.merge!(calculation_for(data_input).first[index] => pheromone)
	end
	results
end

def results_for_quality(data_input)
	results = {}
	calculation_for(data_input).last.each_with_index do |val, index|
	  pheromone = quality_changed_pheromone(val)
	  results.merge!(calculation_for(data_input).first[index] => pheromone)
	end
	results
end

def final_resultset
	["Time"=> results_for_time(prepare_time_data_input),
	 "Quality"=> results_for_time(prepare_quality_data_input),
	 "Cost"=> results_for_time(prepare_cost_data_input)]
end

puts final_resultset