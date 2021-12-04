extends Control

var focusAnimate = "none"

func _ready():
	Global.state = "setLevelState"
	$GridContainer/VBoxContainer/Levls/level1.grab_focus()
	$Panel/AnimationPlayer.current_animation = "mov"
	$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation = "movButton"
	$GridContainer/VBoxContainer/Levls/level1/AudioStreamPlayer.play()
	focusAnimate = "Back"

	# desable panel button focus
	$GridContainer/VBoxContainer/Levls/level1/panel.focus_mode = FOCUS_NONE
	$GridContainer/VBoxContainer/Levls/level2/panel.focus_mode = FOCUS_NONE

func _process(delta):
#level 1

	if $GridContainer/VBoxContainer/Levls/level1.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Level1")
		else:
			focusAnimate = "Level1"
			$GridContainer/VBoxContainer/Levls/level1.focus_mode = 2
			$GridContainer/VBoxContainer/Levls/level1.grab_focus()
			
			$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level1/AudioStreamPlayer.play()

	else:
		if focusAnimate == "Level1" :
			if $GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation == "":
				$GridContainer/VBoxContainer/Levls/level1/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"

#level 2

	if $GridContainer/VBoxContainer/Levls/level2.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Level2")
		else:
			$GridContainer/VBoxContainer/Levls/level2.focus_mode =  2
			$GridContainer/VBoxContainer/Levls/level2.grab_focus()
			
			$GridContainer/VBoxContainer/Levls/level2/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level2/AudioStreamPlayer.play()
			focusAnimate = "Level2"

	else:
		if focusAnimate == "Level2" :
			if $GridContainer/VBoxContainer/Levls/level2/AnimationPlayer.current_animation == "":
				$GridContainer/VBoxContainer/Levls/level2/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"

#level 3

	if $GridContainer/VBoxContainer/Levls/level3.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Level3")
		else:
			$GridContainer/VBoxContainer/Levls/level3.focus_mode =  2
			$GridContainer/VBoxContainer/Levls/level3.grab_focus()
			
			$GridContainer/VBoxContainer/Levls/level3/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level3/AudioStreamPlayer.play()
			focusAnimate = "Level3"

	else:
		if focusAnimate == "Level3" :
			if $GridContainer/VBoxContainer/Levls/level3/AnimationPlayer.current_animation == "":
				$GridContainer/VBoxContainer/Levls/level3/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"
#level 4

	if $GridContainer/VBoxContainer/Levls/level4.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Level4")
		else:
			$GridContainer/VBoxContainer/Levls/level4.focus_mode =  2
			$GridContainer/VBoxContainer/Levls/level4.grab_focus()
			$GridContainer/VBoxContainer/Levls/level4/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level4/AudioStreamPlayer.play()
			focusAnimate = "Level4"

	else:
		if focusAnimate == "Level4" :
			if $GridContainer/VBoxContainer/Levls/level4/AnimationPlayer.current_animation == "":
				$GridContainer/VBoxContainer/Levls/level4/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"

#level 5

	if $GridContainer/VBoxContainer/Levls/level5.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Level5")
		else:
			$GridContainer/VBoxContainer/Levls/level5.focus_mode =  2
			$GridContainer/VBoxContainer/Levls/level5.grab_focus()
			$GridContainer/VBoxContainer/Levls/level5/AnimationPlayer.current_animation = "movButton"
			$GridContainer/VBoxContainer/Levls/level5/AudioStreamPlayer.play()
			focusAnimate = "Level5"

	else:
		if focusAnimate == "Level5" :
			if $GridContainer/VBoxContainer/Levls/level5/AnimationPlayer.current_animation == "":
				$GridContainer/VBoxContainer/Levls/level5/AnimationPlayer.current_animation  = "movButtonBack"
				focusAnimate = "none"


# Back

	if $GridContainer/VBoxContainer/LineOption/Back.is_hovered():
		if focusAnimate != "none":
			AnimationBack("Back")
		else:
			$GridContainer/VBoxContainer/LineOption/Back.focus_mode =  2
			$GridContainer/VBoxContainer/LineOption/Back.grab_focus()
			
			$GridContainer/VBoxContainer/LineOption/AnimationBackButtom.current_animation = "movFont"
			$GridContainer/VBoxContainer/LineOption/Back/AudioStreamPlayer.play()
			focusAnimate = "Back"

	else:
		if focusAnimate == "Back" :
			$GridContainer/VBoxContainer/LineOption/AnimationBackButtom.current_animation = "movFontBack"
			focusAnimate = "none"


func AnimationBack(current):
	if focusAnimate == "Level1" and current != "Level1":
		$GridContainer/VBoxContainer/Levls/level1.focus_mode = false

	if focusAnimate == "Level2" and current != "Level2":
		$GridContainer/VBoxContainer/Levls/level2.focus_mode = false
		
	if focusAnimate == "Level3" and current != "Level3":
		$GridContainer/VBoxContainer/Levls/level3.focus_mode = false

	if focusAnimate == "Level4" and current != "Level4":
		$GridContainer/VBoxContainer/Levls/level4.focus_mode = false
		
	if focusAnimate == "Level5" and current != "Level5":
		$GridContainer/VBoxContainer/Levls/level5.focus_mode = false

	if focusAnimate == "Back" and  current != "Back" :
		$GridContainer/VBoxContainer/LineOption/Back.focus_mode = false
	



func _on_Back_pressed():
	get_tree().change_scene("res://scenes/MainMenu/MainMenu.tscn")

 

func _on_level1_pressed():
	get_tree().change_scene("res://scenes/Levels/level1/Level1.tscn")


func _on_level2_pressed():
	get_tree().change_scene("res://scenes/Levels/level2/Level2.tscn")


func _on_level3_pressed():
	get_tree().change_scene("res://scenes/Levels/level3/Level3.tscn")


func _on_level4_pressed():
	get_tree().change_scene("res://scenes/Levels/level4/Level4.tscn")


func _on_level5_pressed():
	get_tree().change_scene("res://scenes/Levels/level5/Level5.tscn")
