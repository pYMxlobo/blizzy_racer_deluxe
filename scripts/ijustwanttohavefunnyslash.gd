extends RayCast2D


#var target_position : Vector2

func _ready():
  target_position = to_global(ray.target)

func _physics_process(delta):
  ray.target = to_local(target_position)
