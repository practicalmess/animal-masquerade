extends Node

@export var info: AnimalInfo

var worn_mask: MaskInfo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Animal instantiated")

func setup(data: AnimalInfo) -> void:
	info = data
	if info:
		$Sprite2D.texture = info.sprite_texture
		print("Animal name: ", info.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	body.reparent(self)
	var offset = Vector2(0, -40)
	body.set_deferred("position", offset)
