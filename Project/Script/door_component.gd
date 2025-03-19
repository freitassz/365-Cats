extends Area2D
class_name DoorComponent

var _character_ref: BaseCharacter = null
var _in_area = false
@export_category("Variables")
@export var _teleport_position: Vector2  # Define a posição de teleporte exclusiva para cada porta

@export_category("Objects")
@export var _animation: AnimationPlayer = null

func _on_area_body_entered(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = _body
		_in_area = true


func _on_area_body_exited(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = null
		_in_area = false


func _process(delta: float) -> void:
	if _character_ref and Input.is_action_just_pressed("interact") and _in_area == true:
		_animation.play("open")  # Toca a animação de abrir a porta

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "open" and _character_ref:
		_character_ref.global_position = _teleport_position  # Teletransporta o jogador
		_animation.play("close")  # Toca a animação de fechar
		_character_ref = null
		if Global.inside == false:
			Global.inside = true
		else:
			Global.inside = false
