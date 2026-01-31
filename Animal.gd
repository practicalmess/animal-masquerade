extends Node

@export var info: AnimalInfo

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

func check_mask(id: int) -> void:
	if (id == info.correct_mask_id):
		global.score += 1

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	body.call_deferred("reparent", self)
	var offset = Vector2(0, -40)
	body.set_deferred("position", offset)
	
