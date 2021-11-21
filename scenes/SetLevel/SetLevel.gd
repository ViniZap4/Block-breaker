extends Control

var focusAnimate

func _ready():
	$GridContainer/VBoxContainer/Levls/level1.grab_focus()
	$Panel/AnimationPlayer.current_animation = "mov"
	$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation = "movButton"
	$GridContainer/VBoxContainer/Levls/level1/AudioStreamPlayer.play()
	focusAnimate = "Back"


func _process(delta):

#level 1

	if $GridContainer/VBoxContainer/Levls/level1.is_hovered():
		if focusAnimate != "Level1" and focusAnimate == "none" :
			$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level1/AudioStreamPlayer.play()
			focusAnimate = "Level1"

	else:
		if focusAnimate == "Level1" :
			$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation  = "movButtonBack"
			focusAnimate = "none"

#level 2

	if $GridContainer/VBoxContainer/Levls/level2.is_hovered():
		if focusAnimate != "Level2" and focusAnimate == "none" :
			$GridContainer/VBoxContainer/Levls/level2/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level2/AudioStreamPlayer.play()
			focusAnimate = "Level2"

	else:
		if focusAnimate == "Level2" :
			$GridContainer/VBoxContainer/Levls/level2/AnimationPlayer.current_animation  = "movButtonBack"
			focusAnimate = "none"



# Back

	if $GridContainer/VBoxContainer/LineOption/Back.is_hovered():
		if focusAnimate == "none" :
			$GridContainer/VBoxContainer/LineOption/AnimationBackButtom.current_animation = "movFont"
			$GridContainer/VBoxContainer/LineOption/Back/AudioStreamPlayer.play()
			focusAnimate = "Back"

	else:
		if focusAnimate == "Back" :
			$GridContainer/VBoxContainer/LineOption/AnimationBackButtom.current_animation = "movFontBack"
			focusAnimate = "none"




func _on_Back_pressed():
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")



func _on_level1_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")