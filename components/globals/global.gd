extends Node


var width=1330
var height=720

var score=0

var life = 3

var blocksInLevel=0

var apiKey = ""

var f=File.new()
f.open('res://apiKey.env',File.READ)
self.apiKey=f.get_line()
f.close()

SilentWolf.configure({
	"api_key": self.apiKey,
	"game_id": "yourGameName",
	"game_version": "1.0",
	"log_level": 1 
})
