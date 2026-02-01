extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = global.game_state == 'lose'


func _on_button_pressed() -> void:
	global.current_animal = null
	global.score = 0
	global.current_dialogue = ''
	global.used_mask_ids = []
	global.current_animal_index = 0
	global.game_state = 'menu'
	signalbus.emit_signal("_reset_game")
