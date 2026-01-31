extends Node2D

@export var info: MaskInfo

var draggable = false
var offset: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Mask instantiated")

func setup(data: MaskInfo) -> void:
	info = data
	if info:
		$CharacterBody2D/Sprite2D.texture = info.sprite_texture
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset


func _on_character_body_2d_mouse_entered() -> void:
	scale = Vector2(1.05, 1.05)
	draggable = true

func _on_character_body_2d_mouse_exited() -> void:
	scale = Vector2(1, 1)
	draggable = false
