extends KinematicBody2D

var velocity = 459
var veloc = Vector2(velocity,-velocity)

var initTimer = 0
func _process(delta):
	if initTimer <= 3:
		initTimer += delta
	elif initTimer >= 3 and Global.life == 0:
		get_tree().change_scene("res://scenes/SetScore/SetScore.tscn")
		
	
func _physics_process(delta):
	if initTimer >= 3:
		var collision = move_and_collide(veloc*delta)
		
		if collision:

			print(collision.collider.name)
			veloc = veloc.bounce(collision.normal)
			if collision.collider.name == "Frontier":
				$AudioStreamPlayerFrontier.play() 
				get_tree().call_group("camera", "shake", 1)
			elif collision.collider.name == "Platform":
				$AudioStreamPlayerPlatform.play() 
				get_tree().call_group("camera", "shake", 0.5)
			else:
				$AudioStreamPlayerBLock.play() 
				
func _on_Limit_body_entered(body):
	if body.name == "Ball":
		initTimer = 0
		Global.life -= 1
		veloc = Vector2(velocity, -velocity)
		get_parent().get_node("lifeLess/AnimationPlayer").current_animation = "mov"
		if Global.life == 0:
			get_parent().get_node("lifeLess/Title").text = "Game Over!"
		elif Global.life <= 2:
			get_parent().get_node("lifeLess/Title").text =  "only " + String(Global.life) + " Lifes"
		else:
			get_parent().get_node("lifeLess/Title").text =  "only " + String(Global.life) + " Life"
