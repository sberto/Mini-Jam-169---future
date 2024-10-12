extends Button
class_name AutoButton

@export var automation: Automation

func _ready() -> void:
	pressed.connect(_on_pressed)
	automation.automation_update.connect(_update)
	_update_label()
	
func _on_pressed() -> void:
	automation.buy()

func _update(who):
	_update_label()

func _update_label():
	text = "%s (x%s) -$%s +$%s" % [automation.name, automation.res.level, automation.res.cost, automation.res.amount]
