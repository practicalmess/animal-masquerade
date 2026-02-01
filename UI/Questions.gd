extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.pressed.connect(_on_button_pressed.bind(child.name))

func _on_button_pressed(button_name: String) -> void:
	global.show_dialogue_box = true
	global.questions_asked += 1
	global.current_animal.show_answer(button_name)
	if global.questions_asked >= 2:
		for child in get_children():
			if child is BaseButton:
				child.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.questions_asked >= 2 && global.is_mask_selected:
		global.questions_asked = 0
