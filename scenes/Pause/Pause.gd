extends Control

var focusAnimate = ""
var Animated = false

func _ready():
	pass

func _process(delta):
	print(Global.state)
	
	#control pause state
	if  Input.is_action_just_pressed("pause") :
		if get_tree().paused:
			_on_Resume_pressed()

		else:
			_on_Pause_pressed()

	if get_tree().paused:
	#animations control 
		if !Animated:
			$Title/AnimationPlayer.current_animation = "mov"
			$Panel/AnimationPlayer.current_animation = "mov"
			Animated = true
			
		#Resume
		if $Panel/VBoxContainer/Resume.is_hovered():
			if focusAnimate != "resume" and focusAnimate == "none" :
				$Panel/VBoxContainer/Resume/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/Resume/AudioStreamPlayer.play()
				focusAnimate = "resume"

		else:
			if focusAnimate == "resume" :
				$Panel/VBoxContainer/Resume/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"

		#back to set level
		if $Panel/VBoxContainer/setLevel.is_hovered():
			if focusAnimate != "setLevel" and focusAnimate == "none" :
				$Panel/VBoxContainer/setLevel/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/setLevel/AudioStreamPlayer.play()
				focusAnimate = "setLevel"

		else:
			if focusAnimate == "setLevel" :
				$Panel/VBoxContainer/setLevel/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"
		
		#back to main menu
		if $Panel/VBoxContainer/MainMenu.is_hovered():
			if focusAnimate != "MainMenu" and focusAnimate == "none" :
				$Panel/VBoxContainer/MainMenu/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/MainMenu/AudioStreamPlayer.play()
				focusAnimate = "MainMenu"

		else:
			if focusAnimate == "MainMenu" :
				$Panel/VBoxContainer/MainMenu/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"
		
		#exit
		if $Panel/VBoxContainer/exit.is_hovered():
			if focusAnimate != "exit" and focusAnimate == "none" :
				$Panel/VBoxContainer/exit/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/exit/AudioStreamPlayer.play()
				focusAnimate = "exit"

		else:
			if focusAnimate == "exit" :
				$Panel/VBoxContainer/exit/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"


func _on_Resume_pressed():
	$Title/AnimationPlayer.current_animation = "back"
	$Panel/AnimationPlayer.current_animation = "back"
	
	Animated = false
	get_tree().paused = false
	focusAnimate = "none"
	Global.state = "PauseState"

func _on_Pause_pressed():
	if !get_tree().paused: 
		$Title/AnimationPlayer.current_animation = "mov"
		$Panel/AnimationPlayer.current_animation = "mov"
		
		get_tree().paused = true

		$Panel/VBoxContainer/Resume.grab_focus()
		Global.state = "playState"
		
		Animated = false
		focusAnimate = "resume"
	else:
		_on_Resume_pressed() 


func _on_setLevel_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/SetLevel/SetLevel.tscn")


func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")

