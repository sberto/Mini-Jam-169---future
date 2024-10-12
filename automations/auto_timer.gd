extends Timer

@onready var res: AutomationResource = $"../..".automation.res

func _ready():
	wait_time = res.ticks_for_update
