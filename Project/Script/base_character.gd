extends CharacterBody2D
class_name BaseCharacter

@export_category("Objects")
@export var _animation: AnimationPlayer
@export var _sprite2D : Sprite2D

var _move_speed: float = Global.move_speed

func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	


func _move() -> void:
	var _direction: Vector2 = Input.get_vector(
		"move_left", "move_right", "move_up", "move_down"
	)
	
	if Global._is_open or Global.stop_character:
		velocity = Vector2.ZERO
	else:
		velocity = _direction * _move_speed
		move_and_slide()

func _animate() -> void:
	if velocity:
		_animation.play("Run")
		return
	_animation.play("Idle")
	
	if velocity.x > 0:
		_sprite2D.flip_h = false
		
	if velocity.x < 0:
		_sprite2D.flip_h = true

func has_resource(_item_name: String, _amount: int) -> bool:
	return true

func _on_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "Atack_Axe" or _anim_name == "Atack_Hammer":
		set_physics_process(true)
