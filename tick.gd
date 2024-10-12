extends Node

signal tick
signal tick_time_changed

var stop: bool = false

@export var tick_time: float = 1:
	set(v):
		tick_time_changed.emit()
		tick_time = v
		
var time = 0.

func _process(delta: float) -> void:
	if not stop:
		time += delta
		if time > tick_time:
			time = time - tick_time
			tick.emit()
