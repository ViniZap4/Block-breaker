extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.window_fullscreen:
		$fullScreen.hide()
		$NormalScreen.show()
	else:
		$fullScreen.show()
		$NormalScreen.hide()
	




func _on_fullScreen_pressed():

	if !OS.window_fullscreen:
		$fullScreen.hide()
		$NormalScreen.show()
	else:
		$fullScreen.show()
		$NormalScreen.hide()
		
	OS.window_fullscreen = !OS.window_fullscreen
