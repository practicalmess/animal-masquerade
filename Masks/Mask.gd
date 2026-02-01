extends Node2D

class_name MaskNode

@export var info: MaskInfo
@export var is_dragging = false

var draggable = false
var offset: Vector2
var starting_pos: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func setup(data: MaskInfo) -> void:
	info = data
	if info:
		$CharacterBody2D/Sprite2D.texture = info.sprite_texture
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable && !global.is_mask_selected:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			is_dragging = true
			
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		
		if Input.is_action_just_released("click"):
			is_dragging = false
			var dist = global_position.distance_to(global.current_animal.global_position)
			if dist < 100:
				global.current_animal.catch_mask(self)
			
# On hover over mask
func _on_character_body_2d_mouse_entered() -> void:
	if !global.is_mask_selected:
		scale = Vector2(1.05, 1.05)
		draggable = true

func _on_character_body_2d_mouse_exited() -> void:
	scale = Vector2(1, 1)
	draggable = false
