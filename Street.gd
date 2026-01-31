extends Node2D

@export var animal_base: PackedScene
@export var animal_info_list: Array[AnimalInfo]

var current_index: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_next_animal()

func spawn_next_animal() -> void:
	if current_index >= animal_info_list.size():
		return
	
	var current_animal = animal_base.instantiate()
	add_child(current_animal)
	var info = animal_info_list[current_index]
	current_animal.setup(info)
	current_index += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
