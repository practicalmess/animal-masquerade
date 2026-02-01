extends Node

var score: int = 0
var questions_asked: int = 0
var is_mask_selected: bool
var current_animal: Node
var selected_mask: Node = null
var current_dialogue: String = ''
var show_dialogue_box: bool = true
var used_mask_ids: Array[int]

var dialogue = {
	"bear": {
		"Color": "Purple, like the sky when it’s nice and crisp out.",
		"Possession": "A pristine first edition of the novel *The Shadow Returns!*",
		"Fun": "Relax by the fire, sip my hot cocoa and read the most recent issue of *Animals Assemble!*",
		"correct": "It looks just like Nightbear’s!",
		"incorrect": "I can make this work."
	}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
