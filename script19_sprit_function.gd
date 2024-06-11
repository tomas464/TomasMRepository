# Hodnota v PBar se mění v souvislosti s umístěním Godot node
@onready var PBar = $ProgressBar
var SPEED = 2

# Tato funkce se provede každý snímek hry a kontroluje zdali je podmínka na stisknutí klávesy pravdivá
func _process(delta):
	if Input.is_action_pressed("Shift")and Input.is_action_pressed("W"):
		SPEED = 3
		PBar.value -= 1
		
	else:
		SPEED = 2
		PBar.value += 0.1
		
