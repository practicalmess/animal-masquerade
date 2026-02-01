extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signalbus.connect("_play_click", play_click)
	signalbus.connect("_play_dialogue", play_dialogue)
func play_click() -> void:
	$Click.play()
func play_dialogue() -> void:
	match global.current_animal.info.name:
		"Bear":
			$BearDialogue.play()
		"Mouse":
			$MouseDialogue.play()
		"Giraffe":
			$GiraffeDialogue.play()
		"Lion":
			$LionDialogue.play()
		"Snake":
			$SnakeDialogue.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
