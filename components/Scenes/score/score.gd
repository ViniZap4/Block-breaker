extends HBoxContainer

var tempScore = 0 
var temp = 0
var animation = ""

func _ready():
	tempScore = Global.score
	$val.text = String(tempScore) 
	
func _process(delta):	
	if temp < 0.3:
		temp += delta
	else:
		temp = 0.3
		
	if temp >= 0.3 and animation == "pop":
		$AnimationPlayer.current_animation = "normal"
		animation = "none"	

	if tempScore != Global.score:
		tempScore =  Global.score
		$val.text = String(tempScore) 
		$AudioStreamPlayer.play()
		temp = 0
		$AnimationPlayer.current_animation = "pop"
		animation = $AnimationPlayer.current_animation
