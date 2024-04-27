extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.latest_item == 0:
		$Item.play("Axel")
		$Label.text = "Axel"
	elif Global.latest_item == 1:
		$Item.play("Battery")
		$Label.text = "Battery"
	elif Global.latest_item == 2:
		$Item.play("BrakeFluid")
		$Label.text = "Brake Fluid"
	elif Global.latest_item == 3:
		$Item.play("EyesofTruth")
		$Label.text = "Eyes of Truth"
	elif Global.latest_item == 4:
		$Item.play("Gear")
		$Label.text = "Gear"
	elif Global.latest_item == 5:
		$Item.play("MetalPlate")
		$Label.text = "Metal Plate"
	elif Global.latest_item == 6:
		$Item.play("Oil")
		$Label.text = "Oil"
	elif Global.latest_item == 7:
		$Item.play("TheOrb")
		$Label.text = "The Orb"
	elif Global.latest_item == 8:
		$Item.play("Voidbox")
		$Label.text = "Voidbox"
	elif Global.latest_item == 9:
		$Item.play("Wrench")
		$Label.text = "Wrench"
	elif Global.latest_item == 10:
		$Item.play("Blackhole")
		$Label.text = "Blackhole"
	elif Global.latest_item == 11:
		$Item.play("Coin")
		$Label.text = "Coin"
	elif Global.latest_item == 12:
		$Item.play("Jam")
		$Label.text = "Jam"
	elif Global.latest_item == 13:
		$Item.play("Armor")
		$Label.text = "Armor"
	elif Global.latest_item == 14:
		$Item.play("Cloak")
		$Label.text = "Cloak"
	elif Global.latest_item == 15:
		$Item.play("Lance")
		$Label.text = "Lance"
	elif Global.latest_item == 16:
		$Item.play("Pillow")
		$Label.text = "Pillow"
	elif Global.latest_item == 17:
		$Item.play("Bracelet")
		$Label.text = "Bracelet"
	elif Global.latest_item == 18:
		$Item.play("Crystal")
		$Label.text = "Crystal"
	elif Global.latest_item == 19:
		$Item.play("Shield")
		$Label.text = "Shield"
	elif Global.latest_item == 20:
		$Item.play("Flashlight")
		$Label.text = "Flashlight"
	elif Global.latest_item == 21:
		$Item.play("SeeThrough")
		$Label.text = "Eyes that See Through"
	elif Global.latest_item == 22:
		$Item.play("SteelPlate")
		$Label.text = "Steel Plate"
	elif Global.latest_item == 23:
		$Item.play("Glasses")
		$Label.text = "Glasses"
	elif Global.latest_item == 24:
		$Item.play("Sledgehammer")
		$Label.text = "Sledgehammer"
	elif Global.latest_item == 25:
		$Item.play("Syringe")
		$Label.text = "Syringe"
	elif Global.latest_item == 26:
		$Item.play("VampireJaw")
		$Label.text = "Vampire's Jaw"
