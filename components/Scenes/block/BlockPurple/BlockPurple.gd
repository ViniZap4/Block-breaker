extends StaticBody2D

var selfPosition
var selfScale

var NewBlock = load("res://components/Scenes/block/BlockPurpleOrange/BlockPurpleOrange.tscn")
var NewParticle = load("res://components/particles/HitBlock/HitBlock.tscn")

func _ready():
	Global.blocksInLevel +=1 
	selfPosition = transform.get_origin()
	selfScale = transform.get_scale()

func _on_Area2D_body_entered(body):
	Global.score +=1
	Global.blocksInLevel -=1 
	
	var NewParticleColor = NewParticle.instance()

	var NewBlockColor = NewBlock.instance()
	NewBlockColor.translate(selfPosition)
	NewBlockColor.scale = selfScale
	NewBlockColor.add_child(NewParticle.instance())
	Global.blockInstance = NewBlockColor
	Global.instanceControl = true


	get_tree().call_group("camera", "shake", 0.8)
	queue_free()
	queue_free()
