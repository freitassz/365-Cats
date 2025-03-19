extends Control
class_name ComputerHud

func _ready():
	_close_computer()

func _process(delta: float) -> void:
	if Global._in_computer == true and Input.is_action_just_pressed("interact"):
		if Global._is_open == false:
			_open_computer()
		else:
			_close_computer()
 

func _open_computer():
	self.visible = true

func _close_computer():
	self.visible = false

func _on_close_pressed() -> void:
	Global._is_open = false
	_close_computer()
