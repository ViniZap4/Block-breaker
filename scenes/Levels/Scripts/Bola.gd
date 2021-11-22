extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var veloc = Vector2(300,-300)


func _physics_process(delta):
	var collision = move_and_collide(veloc*delta)
	
	if collision:
		print(collision.collider.name)
		veloc = veloc.bounce(collision.normal)
	
	
