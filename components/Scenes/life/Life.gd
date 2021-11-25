extends Node2D

var played = 0

func _ready():
	if(Global.life == 2):
		$Animation1.current_animation = "heart1"
		played = 1
	if(Global.life == 1):
		$Animation1.current_animation = "heart1"
		$Animation2.current_animation = "heart2"
		played = 2

func _process(delta):
	
	if(Global.life == 3):
		pass

	elif(Global.life == 2) and played <= 0:
		$Animation1.current_animation = "heart1"
		played = 1
	elif(Global.life == 1) and played == 1:
		$Animation2.current_animation = "heart2"
		played = 2
	elif(Global.life == 0) and played == 2:
		$Animation3.current_animation = "heart3"
		played = 3
