extends Node
class_name Objective

enum SuccessType {SPENT, AUTO_BOUGHT, TICK_PASS}

@export var success_type: SuccessType
@export var target: int
@export var description: String
var reached: bool = false
