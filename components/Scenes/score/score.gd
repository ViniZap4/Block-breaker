extends HBoxContainer

func _ready():
	pass 

func _process(delta):
	$val.text = String(Global.score) 
