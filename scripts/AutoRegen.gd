extends Timer


func _ready():
	start()

func _on_timeout():
	Global.health = Global.health + ((Global.max_health / 100) * Global.regen_mult)
	Global.shake = false
	
