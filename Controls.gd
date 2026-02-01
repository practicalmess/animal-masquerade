extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var all_buttons = find_children("*", "BaseButton", true)
	
	for button in all_buttons:
		if button.is_in_group("confirm_buttons"):
			button.pressed.connect(_on_button_pressed.bind(button.name))

func _on_button_pressed(button_name) -> void:
	signalbus.emit_signal("_reset_masks")
	if button_name == "Confirm":
		global.is_mask_selected = false
		global.questions_asked = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
