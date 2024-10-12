extends Button

@onready var currency = %Currency

func _on_pressed() -> void:
	currency.amount += 1
