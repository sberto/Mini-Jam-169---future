extends RichTextLabel

@export_multiline var template: String

func _ready() -> void:
	Objectives.reached.connect(_reached)
	
func _reached(what):
	text = template % [what.name, what.description]
	visible = true
	await get_tree().create_timer(10).timeout
	visible = false
