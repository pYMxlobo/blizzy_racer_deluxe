extends Area2D


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var _body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	
	var local_shape_owner = shape_find_owner(local_shape_index)
	var _local_shape_node = shape_owner_get_owner(local_shape_owner)
	if Global.flash == true:
		if body.is_in_group("enemy") == true:
			print("enemy detected")
		elif body.name == "Player":
			print("player detected. ignore this message")
