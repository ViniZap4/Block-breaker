extends StaticBody2D

var selfPosition
var NewParticle = load("res://components/particles/explosionBlock/explosionBlock.tscn")

func _ready():
	Global.blocksInLevel +=1 
	selfPosition = transform.get_origin()
	
	
func _on_Area2D_body_entered(body):

	Global.score +=1
	Global.blocksInLevel -=1
	get_tree().call_group("camera", "shake", 2)
	var NewParticleColor = NewParticle.instance()
	NewParticleColor.translate(selfPosition)
	Global.particleInstance = NewParticleColor
	Global.instanceControl = true
	queue_free()
