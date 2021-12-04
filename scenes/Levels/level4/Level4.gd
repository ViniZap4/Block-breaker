extends Control

var timeControl = 0

func _ready():
	$Panel/AnimationPlayer.current_animation = "mov"
	Global.state = "playState"
	Global.currentLevel = "level4"

func _process(delta):
	timeControl + delta

	
	if Global.blocksInLevel == 0:
		if timeControl <=1.1:
			timeControl += delta
		else:
			if Global.blocksInLevel == 0:
				$Ball.veloc = Vector2(0,0)
				
				if !$victory.playing:
					$victory.play()

				if timeControl <=2:
					timeControl += delta
				else:
					get_tree().change_scene("res://scenes/Levels/level5/Level5.tscn")
			else:
				timeControl = 6
