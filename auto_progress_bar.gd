extends ProgressBar

@onready var timer = $AutoTimer
@onready var button_root = $"../.."
@onready var res: AutomationResource = $"..".automation.res
@onready var tick = Tick

func _process(delta: float) -> void:
	max_value = res.ticks_for_update * tick.tick_time
	value = timer.time_left
