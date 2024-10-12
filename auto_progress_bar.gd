extends ProgressBar

@onready var timer = $AutoTimer
@onready var button_root = $"../.."
@onready var res: AutomationResource = $"..".automation.res

func _process(delta: float) -> void:
	max_value = res.ticks_for_update
	value = timer.time_left
