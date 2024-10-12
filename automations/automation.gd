extends Node
class_name Automation

signal automation_update
@export var res: AutomationResource

func buy():
	if %Currency.amount > res.cost:
		%Currency.amount += res.amount - res.cost
		res.upgrade()
		automation_update.emit(self)

func tick():
	res.tick_count += 1
	res.tick_count %= res.ticks_for_update
	if res.tick_count == 0:
		%Currency.amount += res.amount
