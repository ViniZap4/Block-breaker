extends Node2D


func _ready():
	$CPUParticles2D.set_emitting(true)

func _process(delta):
	if not $CPUParticles2D.is_emitting():
		queue_free()
