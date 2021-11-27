extends Control

var focusAnimate = "none"

func _ready():
	$Panel/AnimationPlayer.current_animation = "mov"
	$Title/AnimationPlayer.current_animation = "mov"
	$Panel/VBoxContainer/Label.text = "Score: " + String(Global.score)
	
	$Panel/VBoxContainer/input/LineEdit.grab_focus()

	#$Panel/AnimationPlayer.current_animation = "mov"
	# $Panel/VBoxContainer/input/lineEdit/AnimationPlayer.current_animation = "movButton"
	# $Panel/VBoxContainer/input/lineEdit/AudioStreamPlayer.play()

func _process(delta):
# send

	if $Panel/VBoxContainer/button/Send.is_hovered():
		if focusAnimate == "none":
			$Panel/VBoxContainer/button/Send/AnimationPlayer.current_animation = "movFont"
			$Panel/VBoxContainer/button/Send/AudioStreamPlayer.play()
			focusAnimate = "send"

	else:
		if focusAnimate == "send":
			$Panel/VBoxContainer/button/Send/AnimationPlayer.current_animation = "movFontBack"
			focusAnimate = "none"

