extends Node2D

@export var info: AnimalInfo

var idle_interval = 1.2
var idle_position = false

var selected_mask: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.current_animal = self
	signalbus.connect("_reset_animal_mask", reset_mask)

func setup(data: AnimalInfo) -> void:
	info = data
	if info:
		$Sprite2D.texture = info.sprite_texture
		print("Animal name: ", info.name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	idle_interval -= delta
	if idle_interval <= 0:
		idle_interval = 1.2
		var y_pos = position.y
		var x_pos = position.x
		if !idle_position:
			y_pos -= 10
			position = Vector2(x_pos, y_pos)
		else:
			y_pos += 10
			position = Vector2(x_pos,y_pos)
		idle_position = !idle_position

func show_answer(question: String) -> void:
	match question:
		"Color":
			global.current_dialogue = info.color_answer
		"Possession":
			global.current_dialogue = info.possession_answer
		"Fun":
			global.current_dialogue = info.fun_answer

func check_mask(id: int) -> bool:
	print(id)
	print(info.correct_mask_id)
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
	#var offset = Vector2(0, -40)
	mask.position = Vector2(info.mask_pos_x, info.mask_pos_y)
	
func reset_mask() -> void:
	var children = get_children()
	for child in children:
		if child is MaskNode:
			child.queue_free()
	
func dismiss() -> void:
	var screenwidth = get_viewport_rect().size.x
	global.show_dialogue_box = false
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(screenwidth + 200, position.y), 2)
	tween.finished.connect(queue_free)
