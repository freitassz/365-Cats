extends CharacterBody2D
class_name Cat

var _can_click: bool = false
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
@export var _afk_timer: Timer

func _ready() -> void:
	_wait_timer = randf_range(1.0, 5.0)
	_direction = _get_direction()
	_walk_timer.start(_wait_timer)
	_afk_timer.start(1)

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

func _on_cat_area_mouse_entered() -> void:
	_can_click = true 

func _on_cat_area_mouse_exited() -> void:
	_can_click = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click_button") and _can_click == true:
		Global.fur += 1 * Global.multiply

func _on_afk_timer_timeout() -> void:
	_afk_timer.start(1)  # Ajusta o timer para disparar a cada 1 segundo
	if Global.upgrade_2:
		Global.fur += Global.fur_per_second 
