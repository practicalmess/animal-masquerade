extends Node

@export var info: AnimalInfo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Animal instantiated")

func setup(data: AnimalInfo) -> void:
	info = data
	if info:
		$Sprite2D.texture = info.sprite_texture
		print("Animal species: ", info.species)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
