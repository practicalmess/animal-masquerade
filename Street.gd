extends Node2D

@export var animal_base: PackedScene
@export var animal_info_list: Array[AnimalInfo]
@export var mask_bar_base: PackedScene

var current_animal_index: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_next_animal()
	reset_masks()
	signalbus.connect("_reset_mask_bar", reset_masks)
	signalbus.connect("_next_animal", spawn_next_animal)

func reset_masks() -> void:
	var children = get_children()
	for child in children:
		if child is MaskBar:
			remove_child(child)
			child.queue_free()
	var fresh_mask_bar = mask_bar_base.instantiate()
	add_child(fresh_mask_bar)
		
func spawn_next_animal() -> void:
	if current_animal_index >= animal_info_list.size():
		if global.score == 5:
			global.game_state = 'win'
		else:
			global.game_state = 'lose'
		return
	
	print(global.questions_asked)
	var current_animal = animal_base.instantiate()
	add_child(current_animal)
	current_animal.position = get_viewport_rect().size / 2
	var info = animal_info_list[current_animal_index]
	current_animal.setup(info)
	global.show_dialogue_box = true
	global.current_dialogue = info.intro_dialog
	current_animal_index += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = global.game_state == "play"
