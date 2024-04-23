extends Timer


@export var pain_amount = 20


@export var inc_ov_time = false


@export var inc_ov_amo = 0.1




func _on_timeout():
	Global.health = Global.health - pain_amount
	if inc_ov_time == true:
		pain_amount = pain_amount + inc_ov_amo
