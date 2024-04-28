extends Button

@export var bus : String



func _on_toggled(toggled_on):
	var music_bus = AudioServer.get_bus_index(bus)
	
	if toggled_on == true:
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	elif toggled_on == false:
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
