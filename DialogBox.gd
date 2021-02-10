extends Control

var dialog = [
	'Hello there, welcome to the game!',
	'If you like what you see, you can follow me for more!',
	'If you don\'t, you should follow me anyway! @kleimaj!'
]

var dialog_index = 0;
var finished = false;

func _ready():
	load_dialog()

func load_dialog():
	pass
