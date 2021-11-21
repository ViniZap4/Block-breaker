extends Control

var focusAnimate

func _ready():
	$VBoxContainer/Play.grab_focus()
	$Panel/AnimationPlayer.current_animation = "mov"
	$VBoxContainer/AnimationPlayButtom.current_animation = "movFont"
	$VBoxContainer/Play/AudioStreamPlayer.play()
	focusAnimate = "play"

func _process(delta):

# Play

	if $VBoxContainer/Play.is_hovered():
		if focusAnimate != "play"  and focusAnimate == "none":
			$VBoxContainer/AnimationPlayButtom.current_animation = "movFont"
			$VBoxContainer/Play/AudioStreamPlayer.play()
			focusAnimate = "play"

	else:
		if focusAnimate == "play" :
			$VBoxContainer/AnimationPlayButtom.current_animation = "movFontBack"
			focusAnimate = "none"


# Hight score

	if $VBoxContainer/HighScore.is_hovered():
		if focusAnimate != "HighScore"  and focusAnimate == "none":
			$VBoxContainer/AnimationHightScoreButtom.current_animation = "movFont"
			$VBoxContainer/HighScore/AudioStreamPlayer.play()

			focusAnimate = "HighScore"

	else:
		if focusAnimate == "HighScore" :
			$VBoxContainer/AnimationHightScoreButtom.current_animation = "movFontBack"
			focusAnimate = "none"


# close

	if $VBoxContainer/Close.is_hovered():
		if focusAnimate != "close" and focusAnimate == "none" :
			$VBoxContainer/AnimationScoreButtom.current_animation = "movFont"
			$VBoxContainer/Close/AudioStreamPlayer.play()
			focusAnimate = "close"

	else:
		if focusAnimate == "close" :
			$VBoxContainer/AnimationScoreButtom.current_animation = "movFontBack"
			focusAnimate = "none"



func _on_Play_pressed():
	get_tree().change_scene("res://scenes/SetLevel/SetLevel.tscn")


func _on_HighScore_pressed():
	get_tree().change_scene("res://scenes/HighScore/HighScore.tscn")


func _on_Close_pressed():
		get_tree().quit()
