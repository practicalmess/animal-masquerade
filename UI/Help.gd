extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = global.game_state == 'help'


func _on_texture_button_pressed() -> void:
	signalbus.emit_signal("_play_click")
	global.game_state = 'play'
