extends Node

# display
var width=1330
var height=720


var score=0
var life = 3

var blocksInLevel=0

var apiKey = ""

var state = ""

func _ready():
	var file = File.new()
	file.open('res://apiKey.env', File.READ)
	self.apiKey=file.get_line()
	file.close() 
	
	SilentWolf.configure({
		"api_key": self.apiKey,
		"game_id": "yourGameName",
		"game_version": "1.0",
		"log_level": 1 
	})

