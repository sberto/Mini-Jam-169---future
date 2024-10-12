extends Node

func _ready() -> void:
	%Tick.tick.connect(_tick)
	for auto in get_children():
		var button = AutoButton.new()
		button.automation = auto
		%AutomationsContainer.add_child(button)

func _tick():
	for auto in get_children():
		auto.tick()
