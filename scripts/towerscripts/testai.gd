extends CharacterBody2D

@export var ai = true

@export var ID = 0

@export var forget_range :float = 1500

@export var see_range : float = 450


@export var enemy_count = true

@export var enemy_value = 1

@export var speed = 400

@export var react_speed = 0.5

@export var en_health = 50
var en_hehe = en_health

@export var weakness : float = 1

var is_detected = false

@export var en_attack_damage : float = 5

@export var do_regen = false
@export var regen_mult : float = 1
@export var player: Node2D
@export var death_stat_incr = false
@export var max_speed_incr = 2
@export var max_drift_incr = 0.1
@export var max_health_incr = 1
@export var drift_charge_incr = 0.01
@export var attack_incr = 1
@export var rotate_speed_incr = 0.1


@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	$Timer.wait_time = react_speed
	if ai == false:
		$Timer.paused = true
	en_hehe = en_health
	if enemy_count == true:
		Global.enemy_total = Global.enemy_total + enemy_value
	print(Global.enemy_total)
	#just some space so that it hopefully doesnt attach this if to the other if
	
	
	if ID == 0:
		$Char.play("Yellow")
	elif ID == 1:
		$Char.play("Green")
	elif ID == 2:
		$Char.play("Blue")
	elif ID == 3:
		$Char.play("Red")
	elif ID == 4:
		$Char.play("Demon")
	elif ID == 5:
		$Char.play("Chill")


func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	if is_detected == true:
		nav_agent.target_position = player.global_position


func _process(_delta):
	if en_hehe <= 0:
		print("death")
		if enemy_count == true:
			Global.enemy_total = Global.enemy_total - enemy_value
		if death_stat_incr == true:
			player.max_forward_speed = player.max_forward_speed + max_speed_incr
			Global.max_health = Global.max_health + max_health_incr
			player.turn_charge = player.turn_charge + drift_charge_incr
			Global.max_drift = Global.max_drift + max_drift_incr
			Global.player_attack = Global.player_attack + attack_incr
			player.rotation_speed = player.rotation_speed + rotate_speed_incr
		queue_free()
	if Global.seeing == true:
		$NavigationAgent2D.debug_enabled = true
	elif Global.seeing == false:
		$NavigationAgent2D.debug_enabled = false







func _on_timer_timeout():
	makepath()
