extends Timer


func _on_timeout():
	if get_parent().do_regen == true:
		get_parent().en_hehe = get_parent().en_hehe + ((get_parent().en_health / 100) * get_parent().regen_mult)
