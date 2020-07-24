extends Node

var beeps = [
	preload("res://sound/effect/morse-1.wav"),
	preload("res://sound/effect/morse-2.wav")
]

var morse = {
	# Numbers
	'0' : [1,1,1,1,1],
	'1' : [0,1,1,1,1],
	'2' : [0,0,1,1,1],
	'3' : [0,0,0,1,1],
	'4' : [0,0,0,0,1],
	'5' : [0,0,0,0,0],
	'6' : [1,0,0,0,0],
	'7' : [1,1,0,0,0],
	'8' : [1,1,1,0,0],
	'9' : [1,1,1,1,0],
	# Letters
	'a' : [0,1],
	'b' : [1,0,0,0],
	'c' : [1,0,1,0],
	'd' : [1,0,0],
	'e' : [0],
	'f' : [0,0,1,0],
	'g' : [1,1,0],
	'h' : [0,0,0,0],
	'i' : [0,0],
	'j' : [0,1,1,1],
	'k' : [1,0,1],
	'l' : [0,1,0,0],
	'm' : [1,1],
	'n' : [1,0],
	'o' : [1,1,1],
	'p' : [0,1,1,0],
	'q' : [1,1,0,1],
	'r' : [0,1,0],
	's' : [0,0,0],
	't' : [1],
	'u' : [0,0,1],
	'v' : [0,0,0,1],
	'w' : [0,1,1],
	'x' : [1,0,0,1],
	'y' : [1,0,1,1],
	'z' : [1,1,0,0],
	' ' : []
}

var output = []


func _ready():
	output = get_sound("hello world")
	emit_sound()


func get_sound(text):
	var encoded = []
	for chr in text:
		var sound = morse[chr]
		encoded.append(sound)
	return encoded

func emit_sound():
	var sound = 0
	if output.size() == 0:
		return
	if output[0].size() > 0:
		sound = output[0][0]
		output[0].pop_front()
		$Beeper.stream = beeps[sound]
		$Beeper.play()
	else:
		output.pop_front()
		$Silence.start()

func _on_Beeper_finished():
	emit_sound()

func _on_Silence_timeout():
	emit_sound()
