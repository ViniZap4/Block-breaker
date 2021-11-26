extends Control



func _ready():
	$Panel/AnimationPlayer.current_animation = "mov"
	Global.state = "playState"

func _process(delta):
	if Global.blocksInLevel == 0:
		get_tree().change_scene("res://scenes/Levels/level2/Level2.tscn")
