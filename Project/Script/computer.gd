extends Node2D
class_name Computer

var _character_ref: BaseCharacter = null


func _on_computer_area_body_entered(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = _body
		Global._in_computer = true

func _on_computer_area_body_exited(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = null
		Global._in_computer = false

func _process(delta: float) -> void:
	if _character_ref and Input.is_action_just_pressed("interact"):
		if Global._is_open == false:
			Global._is_open = true
		else:
			Global._is_open = false
