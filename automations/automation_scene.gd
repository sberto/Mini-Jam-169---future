extends BoxContainer

@export var automation: Automation
@onready var button = $AutoButton
@onready var timer = $AutoProgressBar/AutoTimer

func set_automation(node):
	automation = node
	pass

func pause(is_pause):
	timer.paused = is_pause
	button.disabled = is_pause
