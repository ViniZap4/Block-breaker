extends Control

var tempControl
var tempState
func _ready():
#	if Global.kayboard:
#		initKayBoard()
	tempControl = Global.kayboard
	tempState = get_tree().paused
	
func _process(delta):
#	if tempControl != Global.kayboard:
#		tempControl = Global.kayboard
#
#		if tempControl:
#			initKayBoard()
#		else:
#			BackKayBoard()

	if tempState != get_tree().paused:
		tempState = get_tree().paused

		if get_tree().paused:
			$AnimationPlayer.current_animation = "hidden"
		else:
			$AnimationPlayer.current_animation = "mov"

func _on_buttonRight_button_down():
	Global.input = "Right"


func _on_buttonLeft_button_down():
	Global.input = "Left"


func _on_buttonLeft_button_up():
	if Global.input != "Right":	
		Global.input = ""
	

func _on_buttonRight_button_up():
	if Global.input != "Left":	
		Global.input = ""

#func initKayBoard():
#	$buttonLeft/AnimationPlayer.current_animation = "mov"
#	$buttonRight/AnimationPlayer.current_animation = "mov"
#	$button/AnimationPlayer.current_animation = "mov"
#
#func BackKayBoard():
#	$buttonLeft/AnimationPlayer.current_animation = "Back"
#	$buttonRight/AnimationPlayer.current_animation = "Back"
#	$button/AnimationPlayer.current_animation = "movBack"

func _on_button_pressed():
	Global.kayboard = !Global.kayboard
