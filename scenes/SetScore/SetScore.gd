extends Control

var focusAnimate = "none"
var tempFocus

func _ready():
	$Panel/AnimationPlayer.current_animation = "mov"
	$Title/AnimationPlayer.current_animation = "mov"
	$Panel/VBoxContainer/Label.text = "your Score: " + String(Global.score)
	Global.state = "setScoreState"
	$Panel/VBoxContainer/input/LineEdit.grab_focus()
	
	if OS.window_fullscreen:
		tempFocus = OS.window_fullscreen
		OS.window_fullscreen = false
	else:
		tempFocus = false
	#$Panel/AnimationPlayer.current_animation = "mov"
	# $Panel/VBoxContainer/input/lineEdit/AnimationPlayer.current_animation = "movButton"
	# $Panel/VBoxContainer/input/lineEdit/AudioStreamPlayer.play()

func _process(delta):
# send
	print("tempFocus")
	if $Panel/VBoxContainer/button/Send.is_hovered():
		if focusAnimate == "none":
			$Panel/VBoxContainer/button/Send/AnimationPlayer.current_animation = "movFont"
			$Panel/VBoxContainer/button/Send/AudioStreamPlayer.play()
			focusAnimate = "send"

	else:
		if focusAnimate == "send":
			$Panel/VBoxContainer/button/Send/AnimationPlayer.current_animation = "movFontBack"
			focusAnimate = "none"

# Back
	if $Back.is_hovered():
		if focusAnimate == "none" :
			$Back/AnimationBackButtom.current_animation = "movFont"
			$Back/AudioStreamPlayer.play()
			focusAnimate = "Back"

	else:
		if focusAnimate == "Back" :
			$Back/AnimationBackButtom.current_animation = "movFontBack"
			focusAnimate = "none"
	



func _on_Send_pressed():
	if $Panel/VBoxContainer/input/LineEdit.text!='':
		SilentWolf.Scores.persist_score($Panel/VBoxContainer/input/LineEdit.text, Global.score)
		SilentWolf.Scores.get_high_scores()
		Global.life = 3
		Global.score = 0
		Global.blocksInLevel = 0
		get_tree().change_scene("res://scenes/HighScore/HighScore.tscn")
		


func _on_Back_pressed():
	Global.life = 3
	Global.score = 0
	Global.blocksInLevel = 0
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")


func _on_LineEdit_focus_entered():
	if OS.window_fullscreen:
		tempFocus = OS.window_fullscreen
		OS.window_fullscreen = false
		

func _on_LineEdit_focus_exited():
	if tempFocus:
		OS.window_fullscreen = true
