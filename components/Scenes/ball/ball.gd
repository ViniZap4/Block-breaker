extends KinematicBody2D

var velocity = 400
var veloc = Vector2(velocity,-velocity)

var initTimer = 0
func _process(delta):
	if initTimer <= 3:
		initTimer += delta
	
func _physics_process(delta):
	if initTimer >= 3:
		var collision = move_and_collide(veloc*delta)
		
		if collision:
			$AudioStreamPlayer.play()
			#print(collision.collider.name)
			veloc = veloc.bounce(collision.normal)
		
		
