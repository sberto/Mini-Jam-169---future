extends Node

signal reached

var amount_spent = 0:
	set(v):
		check()
		amount_spent = v
		
var automations_bought = 0:
	set(v):
		check()
		automations_bought = v
		
var ticks_passed = 0:
	set(v):
		check()
		ticks_passed = v
		
func check():
	for obj: Objective in get_tree().get_nodes_in_group("Objectives"):
		if not obj.reached:
			match obj.success_type:
				Objective.SuccessType.SPENT:
					if amount_spent > obj.target: 
						_reached(obj)
				Objective.SuccessType.AUTO_BOUGHT:
					if automations_bought > obj.target: 
						_reached(obj)
				Objective.SuccessType.TICK_PASS:
					if ticks_passed > obj.target: 
						_reached(obj)
			
func _reached(obj: Objective):
	print("reached %s!" % obj.name)
	obj.reached = true
	reached.emit(obj)
