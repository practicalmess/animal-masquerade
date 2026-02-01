extends Node2D

class_name MaskBar

@export var mask_base: PackedScene
@export var mask_properties_list: Array[MaskInfo]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var help_button = find_child('HelpButton')
	help_button.pressed.connect(_on_help_button_pressed.bind())
	for i in range(mask_properties_list.size()):
		var current_mask_info = mask_properties_list[i]
		if global.used_mask_ids.has(current_mask_info.id):
			continue
		var current_mask = mask_base.instantiate()
		add_child(current_mask)
		var mask_position_x = 150 * i + 50
		current_mask.position = Vector2(mask_position_x,0)
		current_mask.setup(mask_properties_list[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_help_button_pressed() -> void:
	$NoteClick.play()
	global.game_state = 'help'
