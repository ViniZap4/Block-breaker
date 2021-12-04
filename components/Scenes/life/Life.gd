extends Node2D

var temp

func _ready():
	if(Global.life == 1):
		$Animation3.current_animation = "heart3Back"
	if(Global.life == 2):
		$Animation3.current_animation = "heart3Back"
		$Animation2.current_animation = "heart2Back"
	if(Global.life == 3):
		$Animation3.current_animation = "heart3Back"
		$Animation2.current_animation = "heart2Back"
		$Animation1.current_animation = "heart1Back"

	temp = Global.life
	
func _process(delta):
	if temp != Global.life:
		if(Global.life == 3):
			
			$Animation1.current_animation = "heart1Back"
		if(Global.life == 2):
		
			if temp == 3:
				$Animation3.current_animation = "heart1"
				
			else:
				$Animation2.current_animation = "heart2Back"
		
		if(Global.life == 1):

			if temp == 2:
				$Animation2.current_animation = "heart2"
				
			else:
				$Animation3.current_animation = "heart3Back"	
			
		if(Global.life == 0):
			$Animation3.current_animation = "heart3"
			
		temp = Global.life
