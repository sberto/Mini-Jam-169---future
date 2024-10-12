extends Label

signal currency_update

@onready var tween = create_tween()
var init_size = get("theme_override_font_sizes/font_size")

var amount: int = 0:
	set(v):
		text = "%s" % amount
		currency_update.emit()
		if (v-amount) > 0:
			tween = create_tween()
			var max = log(float(v - amount))/30.
			print(max)
			tween.tween_method(wow, clamp(max, 0., 1.), 0, .5).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		amount = v
		
func wow(amount: float):
	amount = amount
	var init_value = init_size
	var final_value = init_size + 1000
	set("theme_override_font_sizes/font_size",  init_value + amount * (final_value - init_value))
