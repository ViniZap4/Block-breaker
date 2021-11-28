extends Camera2D

var time = 0
var shakingPower = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	if shakingPower > 0:
		time += delta * 100
		global_position = Vector2(shakingPower, shakingPower).rotated(time)
		shakingPower = lerp(shakingPower, 0, 0.2)

func shake(power):
	shakingPower = power
