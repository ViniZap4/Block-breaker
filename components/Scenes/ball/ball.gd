extends KinematicBody2D

var velocity = 400
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
			$AudioStreamPlayer.play()
			#print(collision.collider.name)
			veloc = veloc.bounce(collision.normal)


func _on_Limit_body_entered(body):
	if body.name == "Ball":
		initTimer = 0
		Global.life -= 1
		veloc = Vector2(velocity,-velocity)
		get_parent().get_node("lifeLess/AnimationPlayer").current_animation = "mov"
		if Global.life == 0:
			get_parent().get_node("lifeLess/Title").text = "Game Over! \n" + String(Global.life) + " vidas"
		else:
			get_parent().get_node("lifeLess/Title").text = "Cuidado! \n mais " + String(Global.life) + " vidas"
