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
			numberChoosed = randomNumber.randi_range(1,90)
			print(numberChoosed)
			if numberChoosed == 50 or numberChoosed == 30 or numberChoosed == 60:
				selfPosition = Global.blockPosition
				var newBonusLife = bonusLife.instance()
				newBonusLife.translate(selfPosition)
				add_child(newBonusLife)
			Global.instanceBonus = false
			
		Global.instanceControl = false
