extends Camera2D

@export var random_strength : float = 30
@export var shake_fade : float = 5




var rng = RandomNumberGenerator.new()

var shake_strength : float = 0

var zoomin = Vector2(1, 1)

var zoomies = Vector2(0.355, 0.355)
# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = Vector2(1, 1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#zoomies = lerp(1, 0.355, 0.1)
	var _sigma = 10
	var rizz = 1
	
	#var tween = create_tween()
	
	# WHY CAN YOU JUST NOT TWEEN A GODDAMN ZOOM ON THE CAMERA THERE IS NO LOGICAL REASON WHY YOU CANT BUT YOU STILL CANT AAAAAAAA
	if Global.race == true:
		zoom = lerp(zoomin, zoomies, rizz)
		
	
	
	if Global.shake == true:
		shaky()
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
	
	offset = randomoffset()



func shaky():
	shake_strength = random_strength



func randomoffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

