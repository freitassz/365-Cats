extends StaticBody2D
class_name GoldMine

var _character_ref: BaseCharacter = null

var _mine_level: int = 0
var _mine_data: Dictionary = {
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

@export_category("Objects")
@export var _sprite2D: Sprite2D


func _on_gold_mine_area_body_entered(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = _body
		
func _on_gold_mine_area_body_exited(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = null
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and _character_ref != null:
		var _item_data: Dictionary = _mine_data[_mine_level]["item_required"]
		if _character_ref.has_resource(
			_item_data["item_name"], _item_data["item_amount"]
		):
			_mine_level += 1
			if _mine_level >= 3:
				_mine_level = 2
			_sprite2D.texture = load(_mine_data[_mine_level]["texture"])
