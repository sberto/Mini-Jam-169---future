extends Node

var automation_scn = preload("res://automations/automation_scene.tscn")

func _ready() -> void:
	Tick.tick.connect(_tick)
	for auto in get_children():
		var automation = automation_scn.instantiate()
		%AutomationsContainer.add_child(automation)
		automation.set_automation(auto)

func _tick():
	for auto in get_children():
		auto.tick()
