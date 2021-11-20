extends Control

func _ready():
	$VBoxContainer/Play.grab_focus()
	$Panel/AnimationPlayer.current_animation = "mov"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
