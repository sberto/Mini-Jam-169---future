extends Label

signal currency_update

var amount: int = 0:
	set(v):
		amount = v
		text = "%s" % amount
		currency_update.emit()
