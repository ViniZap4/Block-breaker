extends Node2D

var veloc = 300

func _ready():
	pass 
	
func _process(delta):
	
	var dirX = 0
	
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	
	   
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	
	translate(Vector2(dirX,0)*veloc*delta)
	pass

