load 'data.rb'
intial_tau_ij_t = 0.0
def calulate_pheromone_at_a_node
	alpha = 1
	beeta = 0.01
	data = Activity1.options
	intial_tau_ij_t = 1.0/data.size
	neeta_risk = 1/data.first.first
	(intial_tau_ij_t ** alpha) * (neeta_risk ** beeta)
end

def updated_tau
	
end

puts calulation