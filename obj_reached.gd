extends RichTextLabel

@export_multiline var template: String

func _ready() -> void:
	Objectives.reached.connect(_reached)
	
func _reached(what):
	text = template % [what.name, what.description]
	visible = true
	var timer = get_child(0)
	if timer:
		timer.wait_time = 3
	else:
		timer = Timer.new()
		timer.wait_time = 3
		add_child(timer)
		
	timer.start()
	await timer.timeout
	visible = false
