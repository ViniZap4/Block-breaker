extends Control

var focusAnimate = ""
var Animated = false

func _ready():
	$Pause/AnimationPlayer.current_animation = "init"

func _process(delta):
	
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
			if focusAnimate != "none":
				AnimationBack("resume")
			else:
				$Panel/VBoxContainer/Resume.focus_mode =  2
				$Panel/VBoxContainer/Resume.grab_focus()

				$Panel/VBoxContainer/Resume/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/Resume/AudioStreamPlayer.play()
				focusAnimate = "resume"

		else:
			if focusAnimate == "resume" :
				$Panel/VBoxContainer/Resume/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"

		#back to set level
		if $Panel/VBoxContainer/setLevel.is_hovered():
			if focusAnimate != "none":
				AnimationBack("setLevel")
			else:
				$Panel/VBoxContainer/setLevel.focus_mode =  2
				$Panel/VBoxContainer/setLevel.grab_focus()

				$Panel/VBoxContainer/setLevel/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/setLevel/AudioStreamPlayer.play()
				focusAnimate = "setLevel"

		else:
			if focusAnimate == "setLevel" :
				$Panel/VBoxContainer/setLevel/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"
		
		#back to main menu
		if $Panel/VBoxContainer/MainMenu.is_hovered():
			if focusAnimate != "none":
				AnimationBack("MainMenu")
			else:
				$Panel/VBoxContainer/MainMenu.focus_mode =  2
				$Panel/VBoxContainer/MainMenu.grab_focus()

				$Panel/VBoxContainer/MainMenu/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/MainMenu/AudioStreamPlayer.play()
				focusAnimate = "MainMenu"

		else:
			if focusAnimate == "MainMenu" :
				$Panel/VBoxContainer/MainMenu/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"
		
		#exit
		if $Panel/VBoxContainer/exit.is_hovered():
			if focusAnimate != "none":
				AnimationBack("exit")
			else:
				$Panel/VBoxContainer/exit.focus_mode =  2
				$Panel/VBoxContainer/exit.grab_focus()

				$Panel/VBoxContainer/exit/AnimationPlayer.current_animation = "movButton"
				$Panel/VBoxContainer/exit/AudioStreamPlayer.play()
				focusAnimate = "exit"

		else:
			if focusAnimate == "exit" :
				$Panel/VBoxContainer/exit/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"


func AnimationBack(current):
	if focusAnimate == "resume" and current != "resume":
		$Panel/VBoxContainer/Resume.focus_mode = false

	if focusAnimate == "setLevel" and current != "setLevel":
		$Panel/VBoxContainer/setLevel.focus_mode = false

	if focusAnimate == "MainMenu" and  current != "MainMenu" :
		$Panel/VBoxContainer/MainMenu.focus_mode = false

	if focusAnimate == "exit" and  current != "exit" :
		$Panel/VBoxContainer/exit.focus_mode = false
		

func _on_Resume_pressed():
	$Title/AnimationPlayer.current_animation = "back"
	$Panel/AnimationPlayer.current_animation = "back"
	$Pause/AnimationPlayer.current_animation = "init"
	
	Animated = false
	get_tree().paused = false
	focusAnimate = "none"
	Global.state = "playState"

func _on_Pause_pressed():
	if !get_tree().paused: 

		$Title/AnimationPlayer.current_animation = "mov"
		$Panel/AnimationPlayer.current_animation = "mov"
		$Pause/AnimationPlayer.current_animation = "back"


		$Panel/VBoxContainer/Resume.grab_focus()

		

		focusAnimate = "resume"
		get_tree().paused = true
		Global.state = "PauseState"
		Animated = false


	else:
		_on_Resume_pressed() 


func _on_setLevel_pressed():
	get_tree().paused = false
	Global.blocksInLevel = 0
	get_tree().change_scene("res://scenes/SetLevel/SetLevel.tscn")
	

func _on_MainMenu_pressed():
	get_tree().paused = false
	Global.blocksInLevel = 0
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")



func _on_Pause_mouse_entered():  
	$Pause/AnimationPlayer.current_animation = "movButton"

func _on_Pause_mouse_exited():
	if !get_tree().paused: 
		$Pause/AnimationPlayer.current_animation  = "movButtonBack"


func _on_exit_pressed():
		get_tree().quit()

