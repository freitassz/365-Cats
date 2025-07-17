extends CharacterBody2D
class_name Cat2


var _wait_timer: float
var _direction: Vector2
var _cat_data: Dictionary = {
	0: {
		"texture": "res://Assets/Character/Personagem.png",
		"item_required": {
			"item_name": "madeira",
			"item_amount": 10
		},
	},
	1: {
		"texture": "res://Assets/Tile_set/House.png",
		"item_required": {
			"item_name": "madeira",
			"item_amount": 20
		}
	},
	2: {
		"texture": "res://Assets/Tile_set/Gold tree.png",
		"item_required": {
			"item_name": "madeira",
			"item_amount": 5
			
		}
	}
}

@export_category("Variables")
@export var _move_speed: float = 16.0

@export_category("Objects")
@export var _sprite: Sprite2D
@export var _animation: AnimationPlayer
@export var _walk_timer: Timer

func _ready() -> void:
	_wait_timer = randf_range(1.0, 5.0)
	_direction = _get_direction()
	_walk_timer.start(_wait_timer)
	

func _physics_process(delta: float) -> void:
	velocity = _direction * _move_speed
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		_direction = velocity.bounce(
			get_slide_collision(0).get_normal()
		).normalized()
		
	_animate()
	
func _animate() -> void:
	if velocity:
		_animation.play("Cat_Run")
		return
	_animation.play("Cat_Idle")
	
func _get_direction() -> Vector2:
	return [
		Vector2(-1,0), Vector2(1,0),Vector2(-1,-1), Vector2(0,-1),
		Vector2(1,-1), Vector2(-1,1), Vector2(0,1), Vector2(1,1), Vector2.ZERO
	].pick_random().normalized()

func _on_walk_timer_timeout() -> void:
	_walk_timer.start(_wait_timer)
	if _direction == Vector2.ZERO:
		_direction = _get_direction()
		return
		
	_direction = Vector2.ZERO
