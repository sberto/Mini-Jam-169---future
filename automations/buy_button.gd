extends Button
class_name AutoButton

@onready var automation = get_parent().automation

func _ready() -> void:
	pressed.connect(_on_pressed)
	update(automation)
	automation.automation_update.connect(update)

func _on_pressed() -> void:
	automation.buy()

func update(who):
	_update_label()

func _update_label():
	text = "%s (x%s) -$%s +$%s" % [automation.name, automation.res.level, automation.res.cost, automation.res.amount]
