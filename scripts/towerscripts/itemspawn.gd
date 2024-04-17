extends Node2D

@export var ID = 0
@export var coin_value = 1
@export var player: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if ID == 0:
		$Item.play("Axel")
	elif ID == 1:
		$Item.play("Battery")
	elif ID == 2:
		$Item.play("BrakeFluid")
	elif ID == 3:
		$Item.play("EyesofTruth")
	elif ID == 4:
		$Item.play("Gear")
	elif ID == 5:
		$Item.play("MetalPlate")
	elif ID == 6:
		$Item.play("Oil")
	elif ID == 7:
		$Item.play("TheOrb")
	elif ID == 8:
		$Item.play("Voidbox")
	elif ID == 9:
		$Item.play("Wrench")
	elif ID == 10:
		$Item.play("Blackhole")
	elif ID == 11:
		$Item.play("Coin")






func _on_touch_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body == player:
		print("you did the touch!")
		if ID == 0:
			OS.delay_msec(25)
			player.rotation_speed = player.rotation_speed + 0.1
			player.temp_rotation_speed = player.temp_rotation_speed + 0.1
			#Global.update_temps = true
			queue_free()
		elif ID == 1:
			OS.delay_msec(25)
			player.turn_charge = player.turn_charge + 0.01
			queue_free()
		elif ID == 2:
			OS.delay_msec(25)
			Global.player_attack = Global.player_attack + 2
			queue_free()
		elif ID == 3:
			OS.delay_msec(25)
			Global.seeing = true
			print("the eyes")
			queue_free()
		elif ID == 4:
			OS.delay_msec(25)
			player.max_forward_speed = player.max_forward_speed + 50
			player.temp_max = player.temp_max + 50
			#Global.update_temps = true
			queue_free()
		elif ID == 5:
			OS.delay_msec(25)
			Global.max_health = Global.max_health + 10
			queue_free()
		elif ID == 6:
			OS.delay_msec(25)
			player.forward_accel = player.forward_accel + 2
			player.backward_accel = player.backward_accel + 1
			queue_free()
		elif ID == 7:
			OS.delay_msec(25)
			player.held_back = player.held_back + 0.05
			player.temp_held_back = player.temp_held_back + 0.05
			#Global.update_temps = true
			queue_free()
		elif ID == 8:
			OS.delay_msec(25)
			Global.max_drift = Global.max_drift + 0.5
			queue_free()
		elif ID == 9:
			OS.delay_msec(25)
			Global.regen_mult = Global.regen_mult + 0.1
			queue_free()
		elif ID == 10:
			OS.delay_msec(25)
			player.warp_time = player.warp_time + 0.01
			queue_free()
		elif ID == 11:
			OS.delay_msec(25)
			Global.coin = Global.coin + coin_value
			queue_free()
