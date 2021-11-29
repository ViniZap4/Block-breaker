extends Node

# display
var width=1330
var height=489

var scoreId = 0

var score=0
var life = 3

var blocksInLevel=0

var state = ""

var NameGame = "VPBreakout"
var apiKey = ""
var version =  "1.0.0"

var blockInstance
var particleInstance

var instanceControl = false

var input = ""
var kayboard = false

func _ready():
	var file = File.new()
	file.open('res://apiKey.env', File.READ)
	self.apiKey=file.get_line()
	file.close() 

	SilentWolf.configure({
		"api_key": self.apiKey,
		"game_id": NameGame,
		"game_version": version,
		"log_level": 1 
	})
	
