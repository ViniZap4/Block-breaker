extends KinematicBody2D

var veloc = 700
var dirX = 0


func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left") or Global.input == "Left":
		dirX = -1
	elif Input.is_action_pressed("ui_right") or Global.input == "Right":
		dirX = 1
	else:
		dirX =0
			 
	move_and_collide(Vector2(veloc,0)*dirX*delta)
