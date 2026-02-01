extends Node

var score: int = 0
var questions_asked: int = 0
var is_mask_selected: bool
var current_animal: Node
var selected_mask: Node = null
var current_dialogue: String = ''
var show_dialogue_box: bool = false
var used_mask_ids: Array[int]
var game_state: String = 'menu'
var show_help: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
