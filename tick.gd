extends Node

signal tick

@export var tick_time: float = 1
var time = 0.

func _process(delta: float) -> void:
	time += delta
	if time > tick_time:
		time = time - tick_time
		tick.emit()
