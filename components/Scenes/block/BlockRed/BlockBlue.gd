extends Node2D



func _ready():
	Global.blocksInLevel +=1 


func _on_Area2D_body_entered(body):
	Global.score +=1
	Global.blocksInLevel -=1 
	print(Global.score)
	queue_free()
