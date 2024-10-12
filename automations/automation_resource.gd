extends Resource
class_name AutomationResource

enum UpgradeType {LINEAR, QUADRATIC}
enum ExtraEffect {NONE, TIME_SLOW_DOWN, TIME_FREEZE}

@export var amount: int
@export var amount_upgrade: int
@export var amount_upgrade_type: UpgradeType
@export var cost: int
@export var cost_upgrade: int
@export var cost_upgrade_type: UpgradeType
@export var ticks_for_update: int = 1
@export var extra_effect: ExtraEffect
@export var freeze_time: int = 1
var tick_count: int
var level: int = 0

func _upgrade_this(this, delta, type):
	match type:
		UpgradeType.LINEAR: return this + delta
		UpgradeType.QUADRATIC: return this + delta * this

func upgrade():
	amount = _upgrade_this(amount, amount_upgrade, amount_upgrade_type)
	cost = _upgrade_this(cost, cost_upgrade, cost_upgrade_type)
	level += 1
