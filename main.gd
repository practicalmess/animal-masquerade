extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signalbus.connect("_reset_game", reset_game)

func reset_game() -> void:
	get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
