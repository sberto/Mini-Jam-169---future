extends Timer

@onready var res: AutomationResource = $"../..".automation.res

func _process(delta: float) -> void:
	wait_time = res.ticks_for_update * Tick.tick_time
