extends Node
class_name Automation

signal automation_update
@export var res: AutomationResource

func buy():
	if %Currency.amount > res.cost:
		%Currency.amount += res.amount - res.cost
		res.upgrade()
		_apply_upgrade_effects()
		automation_update.emit(self)
		Objectives.automations_bought += 1
		Objectives.amount_spent += res.cost
	
func _apply_upgrade_effects():
	match res.extra_effect:
		AutomationResource.ExtraEffect.TIME_FREEZE:
			Tick.stop = true
			get_tree().call_group("Automation", "pause", true)
			await get_tree().create_timer(res.freeze_time).timeout
			get_tree().call_group("Automation", "pause", false)
			Tick.stop = false
		AutomationResource.ExtraEffect.TIME_SLOW_DOWN:
			Tick.tick_time *= 2
			print("Time slowdown!")
			await get_tree().create_timer(1).timeout
			Tick.tick_time /= 2
			print("Time normal!")
		_:
			pass

func tick():
	res.tick_count += 1
	res.tick_count %= res.ticks_for_update
	if res.tick_count == 0:
		%Currency.amount += res.amount
