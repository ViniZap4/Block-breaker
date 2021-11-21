extends Control

var focusAnimate

func _ready():
	$GridContainer/LineOption/Back.grab_focus()
	$Panel/AnimationPlayer.current_animation = "mov"
	$GridContainer/LineOption/AnimationBackButtom.current_animation = "movFont"
	$GridContainer/LineOption/Back/AudioStreamPlayer.play()
	focusAnimate = "Back"


func _process(delta):

# Back

	if $GridContainer/LineOption/Back.is_hovered():
		if focusAnimate != "Back" and focusAnimate == "none" :
			$GridContainer/LineOption/AnimationBackButtom.current_animation = "movFont"
			$GridContainer/LineOption/Back/AudioStreamPlayer.play()
			focusAnimate = "Back"

	else:
		if focusAnimate == "Back" :
			$GridContainer/LineOption/AnimationBackButtom.current_animation = "movFontBack"
			focusAnimate = "none"


func _on_Back_pressed():
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")

