extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	var all_buttons = find_children("*", "BaseButton", true)
	
	for button in all_buttons:
		button.pressed.connect(_on_button_pressed.bind(button.name))

func _on_button_pressed(button_name: String) -> void:
	print(global.questions_asked)
	signalbus.emit_signal("_play_click")
	global.show_dialogue_box = true
	global.questions_asked += 1
	global.current_animal.show_answer(button_name)
	if global.questions_asked >= 2:
		for child in get_children():
			if child is BaseButton:
				child.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_children():
		if child is BaseButton && global.questions_asked < 2:
			child.disabled = false
