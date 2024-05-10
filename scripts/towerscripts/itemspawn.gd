extends Node2D


var random = 0

@export var random_item = false
@export var random_exclude = [3, 11, 21]
@export var ID = 0
@export var coin_value = 1
@export var player: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	random = randi_range(0, 26)
	
	
	while random == 3 or random == 11 or random == 21:
		random = randi_range(0, 26)
	
	
	
	
	if random_item == true:
		ID = random
	
	
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
	elif ID == 12:
		$Item.play("Jam")
	elif ID == 13:
		$Item.play("Armor")
	elif ID == 14:
		$Item.play("Cloak")
	elif ID == 15:
		$Item.play("Lance")
	elif ID == 16:
		$Item.play("Pillow")
	elif ID == 17:
		$Item.play("Bracelet")
	elif ID == 18:
		$Item.play("Crystal")
	elif ID == 19:
		$Item.play("Shield")
	elif ID == 20:
		$Item.play("Flashlight")
	elif ID == 21:
		$Item.play("SeeThrough")
	elif ID == 22:
		$Item.play("SteelPlate")
	elif ID == 23:
		$Item.play("Glasses")
	elif ID == 24:
		$Item.play("Sledgehammer")
	elif ID == 25:
		$Item.play("Syringe")
	elif ID == 26:
		$Item.play("VampireJaw")







func _on_touch_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body == player:
		print("you did the touch!")
		Global.latest_item = ID
		Global.justpicked = true
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
			player.defense = player.defense - 0.01
			player.defense = clamp(player.defense, 0.01, 2)
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
		elif ID == 12:
			OS.delay_msec(25)
			Global.health = Global.health + 30
			queue_free()
		elif ID == 13:
			OS.delay_msec(25)
			player.weather_def = player.weather_def + 1
			queue_free()
		elif ID == 14:
			OS.delay_msec(25)
			player.neg_stat_res = player.neg_stat_res - 0.05
			queue_free()
		elif ID == 15:
			OS.delay_msec(25)
			Global.player_attack = Global.player_attack + 10
			queue_free()
		elif ID == 16:
			OS.delay_msec(25)
			player.has_pillow = true
			player.pillow_amount = player.pillow_amount + 1
			print("eepy time :3")
			queue_free()
		elif ID == 17:
			OS.delay_msec(25)
			player.pos_stat_add = player.pos_stat_add + 0.05
			queue_free()
		elif ID == 18: # --------------------------------------------------INCREASES A LOT OF STUFF SO DO THIS LATER
			OS.delay_msec(25)
			player.rotation_speed = player.rotation_speed + 0.01
			player.temp_rotation_speed = player.temp_rotation_speed + 0.01
			Global.player_attack = Global.player_attack + 1
			player.max_forward_speed = player.max_forward_speed + 10
			player.temp_max = player.temp_max + 10
			Global.max_health = Global.max_health + 5
			player.defense = player.defense - 0.01
			player.forward_accel = player.forward_accel + 1
			player.backward_accel = player.backward_accel + 1
			player.held_back = player.held_back + 0.01
			player.temp_held_back = player.temp_held_back + 0.01
			Global.max_drift = Global.max_drift + 0.1
			Global.regen_mult = Global.regen_mult + 0.05
			player.warp_time = player.warp_time + 0.005
			player.weather_def = player.weather_def + 1
			player.neg_stat_res = player.neg_stat_res - 0.05
			player.pos_stat_add = player.pos_stat_add + 0.05
			player.darkness = player.darkness + 0.15
			player.flat_defense = player.flat_defense + 1
			player.crit_multi = player.crit_multi + 0.05
			player.regen_time = player.regen_time - 0.01
			player.hp_steal = player.hp_steal + 1
			player.reward_multi = player.reward_multi + 0.01
			player.defense = clamp(player.defense, 0.01, 2)
			player.flat_defense = clamp(player.flat_defense, 0, 999)
			player.regen_time = clamp(player.regen_time, 0.05, 1 )
			queue_free()
		elif ID == 19:
			OS.delay_msec(25)
			player.defense = player.defense - 0.05
			player.defense = clamp(player.defense, 0.01, 2)
			queue_free()
		elif ID == 20:
			OS.delay_msec(25)
			player.darkness = player.darkness + 0.35
			queue_free()
		elif ID == 21:
			OS.delay_msec(25)
			print("oops sorry lol apparently you cant enable seeing collision stuff")
			queue_free()
		elif ID == 22:
			OS.delay_msec(25)
			Global.max_health = Global.max_health + 20
			player.flat_defense = player.flat_defense + 3
			player.flat_defense = clamp(player.flat_defense, 0, 999)
			queue_free()
		elif ID == 23:
			OS.delay_msec(25)
			Global.see_bars = true
			queue_free()
		elif ID == 24:
			OS.delay_msec(25)
			player.crit_multi = player.crit_multi + 0.1
			queue_free()
		elif ID == 25:
			OS.delay_msec(25)
			player.regen_time = player.regen_time - 0.05
			player.regen_time = clamp(player.regen_time, 0.05, 1 )
			queue_free()
		elif ID == 26:
			OS.delay_msec(25)
			player.hp_steal = player.hp_steal + 50
			queue_free()
