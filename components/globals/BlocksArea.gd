extends Node2D
onready var bonusLife = preload("res://components/Scenes/bonusLife/bonusLife.tscn")
var selfPosition

var randomNumber = RandomNumberGenerator.new()
var numberChoosed

func _ready():
	pass
	
func _process(delta):
	if Global.instanceControl:
		add_child(Global.blockInstance)
		add_child(Global.particleInstance)

		
		if Global.instanceBonus:
			randomNumber.randomize()
			numberChoosed = randomNumber.randi_range(0,36)
			print(numberChoosed)
			if numberChoosed == 10:
				selfPosition = Global.blockInstance.transform.get_origin()
				numberChoosed
				var newBonusLife = bonusLife.instance()
				newBonusLife.translate(selfPosition)
				add_child(newBonusLife)
			Global.instanceBonus = false
			
		Global.instanceControl = false
