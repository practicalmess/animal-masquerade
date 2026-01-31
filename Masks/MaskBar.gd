extends Node

@export var mask_base: PackedScene
@export var mask_properties_list: Array[MaskInfo]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for mask in mask_properties_list:
		var current_mask = mask_base.instantiate()
		add_child(current_mask)
		current_mask.position = Vector2(100,300)
		current_mask.setup(mask)
		print(mask)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
