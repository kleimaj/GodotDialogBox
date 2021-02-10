extends Control

var dialog = [
	'Hello there, welcome to the game! Press [color=#ff0000]Enter[/color] to continue!',
	'If you like what you see, you can follow me for more!',
	'If you don\'t, you should follow me anyway! @kleimaj!'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	$indicator.hide()
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property($RichTextLabel, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	$indicator.show()
