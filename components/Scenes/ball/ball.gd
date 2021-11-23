extends KinematicBody2D


var veloc = Vector2(400,-400)


func _physics_process(delta):
	var collision = move_and_collide(veloc*delta)
	
	if collision:
		print(collision.collider.name)
		veloc = veloc.bounce(collision.normal)
	
	
