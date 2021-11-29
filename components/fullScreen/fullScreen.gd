extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_fullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	
	if OS.window_fullscreen:
		$fullScreen.hide()
		$NormalScreen.show()
	else:
		$fullScreen.show()
		$NormalScreen.hide()
	

