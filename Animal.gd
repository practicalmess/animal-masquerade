extends Node2D

@export var info: AnimalInfo

var selected_mask: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Animal instantiated")
	global.current_animal = self
	signalbus.connect("_reset_animal_mask", reset_mask)

func setup(data: AnimalInfo) -> void:
	info = data
	if info:
		$Sprite2D.texture = info.sprite_texture
		print("Animal name: ", info.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_answer(question: String) -> void:
	global.current_dialogue = global.dialogue[info.name][question]

func check_mask(id: int) -> bool:
	if (id == info.correct_mask_id):
		global.score += 1
		print("Current score: ", global.score)
		return true
	else:
		print('current score: ', global.score)
	return false
		
func catch_mask(mask) -> void:
	global.is_mask_selected = true
	global.selected_mask = mask
	mask.reparent(self)
	mask.draggable = false
	mask.is_dragging = false
	var offset = Vector2(0, -40)
	mask.position = offset
	
func reset_mask() -> void:
	var children = get_children()
	for child in children:
		if child is MaskNode:
			child.queue_free()
	
func dismiss() -> void:
	var screenwidth = get_viewport_rect().size.x
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(screenwidth + 200, position.y), 2)
	tween.finished.connect(queue_free)
