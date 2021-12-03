extends KinematicBody2D

var veloc = 10000

func _ready():
	pass

func _process(delta):
	
	move_and_slide(Vector2(0,veloc) *delta)

func _on_Area2D_body_entered(body):
	if Global.life <= 2:
		Global.life +=1
	queue_free()
