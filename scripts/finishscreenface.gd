extends AnimatedSprite2D

func _ready():
	if Global.player_selected == 0:
		play("Blizzy")
	elif Global.player_selected == 1:
		play("Yogu")
	elif Global.player_selected == 2:
		play("Robot")
	elif Global.player_selected == 3:
		play("Germ")
	elif Global.player_selected == 4:
		play("Penvort")
	elif Global.player_selected == 5:
		play("Oart")
	elif Global.player_selected == 6:
		play("Will")
	elif Global.player_selected == 7:
		play("Bane")
