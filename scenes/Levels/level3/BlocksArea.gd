extends Node2D


func _ready():
	pass
	
func _process(delta):
	if Global.instanceControl:
		add_child(Global.blockInstance)
		add_child(Global.particleInstance)
		Global.instanceControl = false
