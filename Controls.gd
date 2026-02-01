extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var all_buttons = find_children("*", "BaseButton", true)
	
	for button in all_buttons:
		if button.is_in_group("confirm_buttons"):
			button.pressed.connect(_on_button_pressed.bind(button.name))

func _on_button_pressed(button_name) -> void:
	global.is_mask_selected = false
	signalbus.emit_signal("_play_click")
	var current_animal = global.current_animal
	if button_name == "Confirm":
		var selection_id = global.selected_mask.info.id
		var correct = current_animal.check_mask(selection_id)
		signalbus.emit_signal("_play_dialogue")
		if correct:
			global.current_dialogue = current_animal.info.correct_dialog
		else:
			global.current_dialogue = current_animal.info.incorrect_dialog
		await get_tree().create_timer(2.0).timeout
		current_animal.dismiss()
		await get_tree().create_timer(2.0).timeout
		global.used_mask_ids.push_back(selection_id)
		signalbus.emit_signal("_reset_mask_bar")
		signalbus.emit_signal("_next_animal")
		global.questions_asked = 0
		global.selected_mask = null
	elif button_name == "Reset":
		signalbus.emit_signal("_reset_animal_mask")
		signalbus.emit_signal("_reset_mask_bar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = global.game_state == 'play'
