extends Node

@export var info: MaskInfo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if info:
		print("Mask color: ", info.color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
