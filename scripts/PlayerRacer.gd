extends CharacterBody2D


@export var blizzy : Resource
@export var yogu : Resource
@export var robot : Resource
@export var germ : Resource
@export var penvort : Resource
@export var oart : Resource
@export var will : Resource
@export var bane : Resource





var stats : Resource




var custom
#this stuff is all the cool movement
var max_forward_speed : int = 1252
var forward_accel : float = 15
var max_backward_speed : int = 100
var backward_accel : int = 5
var rotation_speed : = 2.2
var rotation_accel = 0
var rotation_zoom = 0.1
var temp_rotation_speed
var forward
var held_back = 0.66
var temp_held_back : float = 0
var drag : int = 45
var temp_max : int
var rotation_direction = 0
#var drift_charge = 0.0
var turn_charge = 0.05
var drift_multi = 2.0
#var Global.max_drift = 18.1
@export var coins_needed = 0
var temp_pa = Global.player_attack

@onready var warp_time = $WarpFlash.wait_time
#@export var camera : Node2D
#@onready var warptail = $Funny/CollisionShape2D.shape.height
@export var do_start_countdown = true

var is_going = false

var regen_time : float = 1

var crit_multi : float = 2

var reward_multi : float = 1

var darkness = 2.625

var turning = false

var weather_def = 0

var neg_stat_res : float = 1

var pos_stat_add : float = 1

var has_pillow = false

var defense : float = 1

var flat_defense = 0

var hp_steal = 0

var active_pillow = false

var pillow_amount = 0

var hitbox_w = 51.32

var hitbox_r = 13.37

@onready var ability_c = $cooldowns/ability_cooldown

@onready var ability_l = $cooldowns/ability_cooldown/ability_last

@onready var ability_t = $cooldowns/ability_cooldown/cooldown_timer

var flying = false

# this should be called when saving the players data
func savetowerdata():
	var file = FileAccess.open("user://tower.save", FileAccess.WRITE)
	file.store_var(max_forward_speed)
	file.store_var(forward_accel)
	file.store_var(max_backward_speed)
	file.store_var(backward_accel)
	file.store_var(rotation_speed)
	file.store_var(held_back)
	file.store_var(drag)
	file.store_var(rotation_direction)
	file.store_var(turn_charge)
	file.store_var(drift_multi)
	file.store_var(is_going)
	file.store_var(Global.regen_mult)
	file.store_var(Global.max_drift)
	file.store_var(Global.max_health)
	file.store_var(Global.player_attack)
	file.store_var(Global.drift_charge)
	file.store_var(Global.player_selected)
	file.store_var(Global.ai_difficulty)
	file.store_var(warp_time)
	file.store_var(regen_time)
	file.store_var(crit_multi)
	file.store_var(reward_multi)
	file.store_var(darkness)
	file.store_var(Global.health)
	file.store_var(weather_def)
	file.store_var(neg_stat_res)
	file.store_var(pos_stat_add)
	file.store_var(has_pillow)
	file.store_var(defense)
	file.store_var(flat_defense)
	file.store_var(hp_steal)
	file.store_var(pillow_amount)


# and this should be called when you gotta load that stuff
func loadtowerdata():
	if FileAccess.file_exists("user://tower.save"):
		print("you has tower save data :D")
		var file = FileAccess.open("user://tower.save", FileAccess.READ)
		max_forward_speed = file.get_var()
		forward_accel = file.get_var()
		max_backward_speed = file.get_var()
		backward_accel = file.get_var()
		rotation_speed = file.get_var()
		held_back = file.get_var()
		drag = file.get_var()
		rotation_direction = file.get_var()
		turn_charge = file.get_var()
		drift_multi = file.get_var()
		is_going = file.get_var()
		Global.regen_mult = file.get_var()
		Global.max_drift = file.get_var()
		Global.max_health = file.get_var()
		Global.player_attack = file.get_var()
		Global.drift_charge = file.get_var()
		Global.player_selected = file.get_var()
		Global.ai_difficulty = file.get_var()
		warp_time = file.get_var()
		regen_time = file.get_var()
		crit_multi = file.get_var()
		reward_multi = file.get_var()
		darkness = file.get_var()
		Global.health = file.get_var()
		weather_def = file.get_var()
		neg_stat_res = file.get_var()
		pos_stat_add = file.get_var()
		has_pillow = file.get_var()
		defense = file.get_var()
		flat_defense = file.get_var()
		hp_steal = file.get_var()
		pillow_amount = file.get_var()
		load_racer_sprite()
	else:
		print("you has no tower data D:")
		


#and this is just to make the texture match without loading the base stats
func load_racer_sprite():
	if Global.player_selected == 0:
		$PlayerRacer.play("Blizzy")
	elif Global.player_selected == 1:
		$PlayerRacer.play("Yogu")
	elif Global.player_selected == 2:
		$PlayerRacer.play("Robot")
	elif Global.player_selected == 3:
		$PlayerRacer.play("Germ")
	elif Global.player_selected == 4:
		$PlayerRacer.play("Penvort")
	elif Global.player_selected == 5:
		$PlayerRacer.play("Oart")
	elif Global.player_selected == 6:
		$PlayerRacer.play("Will")
	elif Global.player_selected == 7:
		$PlayerRacer.play("Bane")
	else:
		OS.crash("Node2D")


#this loads all those base stat changes and such
func load_stats():
	if Global.player_selected == 0:
		$PlayerRacer.play("Blizzy")
		stats = blizzy
	elif Global.player_selected == 1:
		$PlayerRacer.play("Yogu")
		stats = yogu
		max_forward_speed = stats.max_forward_speed
		drag = stats.drag
		forward_accel = stats.forward_accel
		rotation_speed = stats.rotation_speed
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.player_attack = stats.Global.player_attack
		Global.max_health = stats.Global.max_health
		Global.max_drift = stats.Global.max_drift
		ability_t.wait_time = 20
		
	elif Global.player_selected == 2:
		$PlayerRacer.play("Robot")
		stats = robot
		max_forward_speed = stats.max_forward_speed
		drag = stats.drag
		forward_accel = stats.forward_accel
		rotation_speed = stats.rotation_speed
		max_backward_speed = stats.max_backward_speed
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.player_attack = Global.player_attack + 30
		Global.max_health = Global.max_health + 75
		Global.max_drift = Global.max_drift - 2
		ability_l.wait_time = 0.1
		ability_t.wait_time = 40
		
	elif Global.player_selected == 3:
		$PlayerRacer.play("Germ")
		stats = germ
		max_forward_speed = stats.max_forward_speed
		drag = stats.drag
		rotation_speed = stats.rotation_speed
		forward_accel = stats.forward_accel
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.max_drift = Global.max_drift + 2.6
		Global.player_attack = Global.player_attack - 20
		Global.regen_mult = Global.regen_mult + 0.5
		ability_l.wait_time = 6
		ability_t.wait_time = 59
		
		#drift_multi = drift_multi + 0.5
	elif Global.player_selected == 4:
		$PlayerRacer.play("Penvort")
		stats = penvort
		max_forward_speed = stats.max_forward_speed
		drag = stats.drag
		rotation_speed = stats.rotation_speed
		max_backward_speed = stats.max_backward_speed
		backward_accel = stats.backward_accel
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.max_drift = Global.max_drift + 3.3
		Global.player_attack = Global.player_attack - 2
		Global.max_health = Global.max_health - 5
		ability_l.wait_time = 4
		ability_t.wait_time = 35
		
	elif Global.player_selected == 5:
		$PlayerRacer.play("Oart")
		stats = oart
		max_forward_speed = stats.max_forward_speed
		drag = stats.drag
		rotation_speed = stats.rotation_speed
		forward_accel = stats.forward_accel
		max_backward_speed = stats.max_backward_speed
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.max_drift = Global.max_drift - 3
		Global.player_attack = Global.player_attack - 10
		Global.max_health = Global.max_health - 40
		ability_l.wait_time = 10
		ability_t.wait_time = 48
		
		#drift_multi = drift_multi + 2
	elif Global.player_selected == 6:
		$PlayerRacer.play("Will")
		stats = will
		max_forward_speed = stats.max_forward_speed
		forward_accel = stats.forward_accel
		drag = stats.drag
		rotation_speed = stats.rotation_speed
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.max_drift = Global.max_drift + 5
		drift_multi = stats.drift_multi
		Global.max_health = Global.max_health - 75
		Global.player_attack = Global.player_attack - 13
		Global.regen_mult = Global.regen_mult + 1
		ability_l.wait_time = 8
		ability_t.wait_time = 15
		
	elif Global.player_selected == 7:
		$PlayerRacer.play("Bane")
		stats = bane
		max_forward_speed = stats.max_forward_speed
		rotation_speed = stats.rotation_speed
		forward_accel = stats.forward_accel
		max_backward_speed = stats.max_backwad_speed
		backward_accel = stats.backward_accel
		drag = stats.drag
		turn_charge = stats.turn_charge
		held_back = stats.held_back
		Global.max_drift = Global.max_drift - 7
		drift_multi = stats.drift_multi
		Global.max_health = Global.max_health + 150
		Global.player_attack = Global.player_attack + 10
		Global.seeing = true
		ability_l.wait_time = 1
		ability_t.wait_time = 1
		
	else:
		OS.crash("Node2D")
	Global.fresh = false


func _ready():
	#if FileAccess.file_exists("user://garage/custom.gd"):
	#	custom = FileAccess.open("user://garage/custom.gd", FileAccess.READ)
	#	hitbox_w = custom.get_var(hitbox_w)
	#	hitbox_r = custom.get_var(hitbox_r)
	Global.shake = false
	OS.delay_msec(40)
	if Global.fresh == true:
		load_stats()
		Global.health = Global.max_health
	else:
		loadtowerdata()
	
	
	$WarpFlash.wait_time = warp_time
	temp_rotation_speed = rotation_speed
	temp_max = max_forward_speed
	temp_held_back = held_back
	max_forward_speed = temp_max
	$AutoRegen.wait_time = regen_time
	ability_c.max_value = ability_t.wait_time

	
	if do_start_countdown == true:
		$READY.play()
	elif do_start_countdown == false:
		bgm()
		Global.race = true
		OS.delay_msec(100)
		ability_t.autostart = true

@onready var backmusic : AudioStreamPlayer2D = $BGMTEST



func temp_update():
	if Global.update_temps == true:
		if Input.is_action_pressed("left"):
			pass
		elif Input.is_action_pressed("right"):
			pass
		else:
			pass
			#$WarpFlash.wait_time = warp_time
			#temp_rotation_speed = rotation_speed
			#temp_max = max_forward_speed
			#temp_held_back = held_back
			#Global.update_temps = false


#this is how music is done
func bgm():
	if Global.bgm == 0:
		backmusic = $BGMTEST
	elif Global.bgm == 1:
		backmusic = $BGMGREEN
	elif Global.bgm == 2:
		backmusic = $BGMDESERT
	elif Global.bgm == 3:
		backmusic = $BGMFINAL
	elif Global.bgm == 4:
		backmusic = $BGMJOKE
	elif Global.bgm == 5:
		backmusic = $BGMCLIMBER
	elif Global.bgm == 6:
		backmusic = $BGMSKY
	backmusic.play()

#this. this goddamn thing. this sucks. really bad.
func releasethedrift():
	Global.flash = true
	Global.ws = position
	if Global.drift_charge >= (Global.max_drift * 0.825):
		Global.player_attack = Global.player_attack * crit_multi
		$WARP.play()
		backmusic.stream_paused = true
		$FORWARD.stop()
		$TURN.stop()
		OS.delay_msec(1000)
		Global.flash = true
		backmusic.stream_paused = false
	max_forward_speed = max_forward_speed * (drift_multi * 1.5)
	forward = forward * Global.drift_charge
	rotation_speed = temp_rotation_speed
	max_forward_speed = max_forward_speed - (max_forward_speed / (drift_multi * 1.5))
	Global.drift_charge = 0
	held_back = temp_held_back
	$TURN.stop()
	OS.delay_msec(25)
	$WarpFlash.set_paused(false)
	$WarpFlash.start()
	if temp_max != max_forward_speed:
		max_forward_speed = temp_max
	if Global.player_attack != temp_pa:
		Global.player_attack = temp_pa
	print(max_forward_speed)
#this is where the horrors occur. tread with the knowledge that all of this is nonsense that barely works and has so many problems



#why is flash called when quitting? i do not know
func _process(_delta):
#	$cameracontroller.remote_path = str(camera)
	if Global.flash == false:
		Global.ws = Vector2(0, 0)
	if Input.is_action_just_pressed("quit_menu"):
		Global.flash = true
		backmusic.stop()
		OS.crash("Node2D")
	if active_pillow == true:
		Global.regen_mult = Global.regen_mult + (pillow_amount * 3)
	elif active_pillow == false:
		Global.regen_mult = Global.regen_mult - (pillow_amount * 3)
	if held_back < 0:
		held_back = 0
	if rotation_speed < 0:
		rotation_speed = 0
	if Global.health > Global.max_health:
		Global.health = Global.max_health
	$AutoRegen.wait_time = regen_time
	ability_c.value = ability_t.time_left
	temp_update()

var momentum = float(velocity.angle())

func _physics_process(delta: float) -> void:
	if Global.race == true:
		movement(delta)
		move_and_slide()

func movement(delta: float) -> void:
	forward = Input.get_axis("up", "down")
	if is_going == true:
		rotation_direction = Input.get_axis("left", "right")
	#tried to add drift here it did not work :/
#	if rotation_direction < 0:
#		if rotation_accel < rotation_speed:
#			rotation_accel += rotation_zoom
#	elif rotation_direction > 0:
#		if rotation_accel < rotation_speed:
#			rotation_accel -= rotation_zoom
	#if Input.is_action_just_pressed("up"):
	#	is_going = true
	#	pass
	
	if forward == 0:
		$PillowTimer.start()
	
	if forward != 0:
		active_pillow = false
	
	
	
	
	if Input.is_action_just_released("up"):
		Global.drift_charge = 0
	if Input.is_action_just_released("down"):
		Global.drift_charge = 0
		if temp_max != max_forward_speed:
			max_forward_speed = temp_max
			held_back = temp_held_back
	if Input.is_action_pressed("left"):
		if flying == false:
			if Input.is_action_pressed("right"):
				forward = 0
			else:
				if is_going == true:
					turning = true
					Global.drift_charge = clamp(Global.drift_charge + turn_charge, 0, Global.max_drift)
					rotation_speed = rotation_speed * (Global.drift_charge / 25) + .9
					held_back = held_back - 0.02
	if Input.is_action_pressed("right"):
		if flying == false:
			if Input.is_action_pressed("left"):
				forward = 0
			else:
				if is_going == true:
					turning = true
					Global.drift_charge = clamp(Global.drift_charge + turn_charge, 0, Global.max_drift)
					rotation_speed = rotation_speed * (Global.drift_charge / 25) + .9
					held_back = held_back - 0.02
	if Input.is_action_just_released("left"):
		turning = false
		if flying == false:
			if is_going == true:
				releasethedrift()
	if Input.is_action_just_released("right"):
		turning = false
		if flying == false:
			if is_going == true:
				releasethedrift()
	if Input.is_action_just_pressed("left"):
		#if is_going == true:
		if flying == false:
			if Input.is_action_pressed("right"):
				pass
			else:
				max_forward_speed = max_forward_speed / drift_multi
				$TURN.play()
				forward = forward * held_back
	if Input.is_action_just_pressed("right"):
		#if is_going == true:
		if flying == false:
			if Input.is_action_pressed("left"):
				pass
			else:
				max_forward_speed = max_forward_speed / drift_multi
				$TURN.play()
				forward = forward * held_back
	if flying == false:
		rotation -= ((rotation_direction * (rotation_speed * 1.5) * delta) * forward)
	if forward < 0:
		is_going = true
		velocity = transform.y * forward * max_forward_speed
		$"PlayerRacer/Wheels".play("wheel_active")
		$FORWARD.play()
		Global.drift_charge = Global.drift_charge + 0.0001
	elif forward > 0:
		is_going = true
		velocity = transform.y * forward * max_backward_speed
		rotation_speed = rotation_speed * (Global.drift_charge / 25) + .9
		$"PlayerRacer/Wheels".play("wheel_reverse")
		$BACKWARD.play()
	else:
		is_going = false
		velocity.y = move_toward(velocity.y, 0, drag)
		velocity.x = move_toward(velocity.x, 0, drag) 
		$"PlayerRacer/Wheels".play("wheel_idle")
		$FORWARD.stop()
		$BACKWARD.stop()
		$TURN.stop()

#why is this at the bottom? idk
func _on_ready_finished():
	bgm()
	Global.race = true
	OS.delay_msec(100)
	ability_t.autostart = true



func _on_warp_flash_timeout():
	Global.flash = false


func _on_pillow_timer_timeout():
	active_pillow = true


func load_custom_char():
	max_forward_speed = custom.get_var()
	forward_accel = custom.get_var()
	max_backward_speed = custom.get_var()
	backward_accel = custom.get_var()
	rotation_speed = custom.get_var()
	held_back = custom.get_var()
	drag = custom.get_var()
	turn_charge = custom.get_var()
	drift_multi = custom.get_var()
	Global.regen_mult = custom.get_var()
	Global.max_drift = custom.get_var()
	Global.max_health = custom.get_var()
	Global.player_attack = custom.get_var()
	regen_time = custom.get_var()
	crit_multi = custom.get_var()
	reward_multi = custom.get_var()
	darkness = custom.get_var()
	weather_def = custom.get_var()
	neg_stat_res = custom.get_var()
	pos_stat_add = custom.get_var()
	has_pillow = custom.get_var()
	defense = custom.get_var()
	flat_defense = custom.get_var()
	hp_steal = custom.get_var()
	pillow_amount = custom.get_var()




func _on_ability_last_timeout():
	if Global.player_selected == 0:
		max_forward_speed = temp_max
	elif Global.player_selected == 1:
		pass
	elif Global.player_selected == 2:
		max_forward_speed = temp_max
	elif Global.player_selected == 3:
		flying = false
		max_forward_speed = temp_max
		$PlayerRacer.play("Germ")
		$PlayerRacer/Wheels.show()
		$GPUParticles2D.show()
		$GPUParticles2D2.show()
	elif Global.player_selected == 4:
		max_forward_speed = temp_max
		forward_accel = forward_accel / 2
		rotation_speed = temp_rotation_speed
		drag = drag + 10
	elif Global.player_selected == 5:
		$Collider.disabled = false
		$PlayerRacer.play("Oart")
		$PlayerRacer/Wheels.show()
	elif Global.player_selected == 6:
		max_forward_speed = temp_max
		forward_accel = forward_accel / 4
	elif Global.player_selected == 7:
		pass


func _input(_event):
	if Input.is_action_just_pressed("ability"):
		if ability_t.time_left == 0:
			if ability_c.value == ability_c.min_value:
				if Global.player_selected == 0:
					max_forward_speed = max_forward_speed * 2
				elif Global.player_selected == 1:
					Global.drift_charge = Global.max_drift
				elif Global.player_selected == 2:
					max_forward_speed = max_forward_speed * 4
					forward = forward * 20
					OS.delay_msec(20)
				elif Global.player_selected == 3:
					print("wow im flying weeee")
					flying = true
					max_forward_speed = max_forward_speed * 1.5
					$PlayerRacer.play("Flying")
					$PlayerRacer/Wheels.hide()
					$GPUParticles2D.hide()
					$GPUParticles2D2.hide()
					rotation_speed = 0
				elif Global.player_selected == 4:
					print("lock in.")
					max_forward_speed = max_forward_speed * 2
					forward_accel = forward_accel * 2
					rotation_speed = rotation_speed * 2
					drag = drag - 10
				elif Global.player_selected == 5:
					$Collider.disabled = true
					$PlayerRacer.play("Clip")
					$PlayerRacer/Wheels.hide()
				elif Global.player_selected == 6:
					max_forward_speed = max_forward_speed * 4
					forward_accel = forward_accel * 4
				elif Global.player_selected == 7:
					$WARP.play()
				
				ability_l.start()
				ability_t.start()



func shakestop():
	Global.shake = false



