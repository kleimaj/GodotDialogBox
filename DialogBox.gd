extends Control

var dialog = [
	'Hello there, welcome to the game! Press [color=#ff0000]Enter[/color] to continue!',
	'What\'s that?',
	'...',
	'Hello...? Is anyone in here?',
	'Meow!',
	'Hey wait!',
	'...',
	'Meow! Meow!',
	'...',
	'Where am I?',
	'Hmph! Not exactly who I was expecting but--',
	'AAAAA!!!',
	'AAAA WHY ARE YOU SCREAMING??',
	'Who are you!? Do you have any idea what’s going on here!?',
	'Ah ah! Be calmed young friend, it appears your curiosity got the better of you! Not that I’m one to talk..',
	'Huh??',
	'I’m Dr. Flores, and it appears that you and I are trapped!',
	'Eh? Wait like- in that bottle??',
	'This is not just some bottle! It’s- well it WAS my award winning terrarium. You see, I’m a botanist and fungi expert.',
	'Black mold has been wreaking havoc on my terrariums and surprisingly, those same black mold spores cause shrinking.',
	'[color=#ff0000]The only way for us to return to normal size is to eradicate the black spores and return my terrariums to their former glory![/color]',
	'I came in here to try and find a better treatment and rebalance the ecosystem.',
	'That\'s how I got in here? I thought that was smoke! [color=#ff0000]It’s billowing out into the forest, we have to stop this mold before it spreads beyond control![/color]',
	'Agreed, okay lets.. Wait, how did you get in here?',
	'I was out for a hike, and I saw the spores. I thought it was smoke so I came into your conservatory to make sure no one was inside. Then that cat-',
	'Mrs. (cats name)! I had hoped she would seek out another one of my old assistants, but I suspect she thinks too highly of them to lure them here...',
	'Is that so… n_n;;',
	'Nevermind that then, here take this!',
	'...',
	'A book?',
	'This is not just any book! It contains all the knowledge I’ve cultivated through my studies. I have it mostly committed to memory, so you can hold onto it for the time being.',
	'...',
	'Alright, follow closely behind me, it’s easy to get lost in this dark, dense bush. You don’t want to end up like the last assistant (cats name) brought me…',
	'What happened?',
	'Not sure… Never saw them again after we walked into the darkness…'
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
