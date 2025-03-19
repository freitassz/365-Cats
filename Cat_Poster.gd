extends Node2D

@onready var CatPosterHd = $Canva/CatPicture

var _onposter = false
var _character_ref: BaseCharacter = null
var _isopen = false

func _process(delta: float) -> void:
	if Global.upgrade_3 == true:
		self.visible = true
	else:
		self.visible = false
	
	if _character_ref and Input.is_action_just_pressed("interact"):
		if _isopen == false:
			_isopen = true
		else:
			_isopen = false

		if _isopen == true:
			CatPosterHd.visible = true
			Global.stop_character = true
		else:
			CatPosterHd.visible = false
			Global.stop_character = false

func _on_poster_area_body_entered(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = _body
		_onposter = true

func _on_poster_area_body_exited(_body: Node2D) -> void:
	if _body is BaseCharacter:
		_character_ref = null
		_onposter = false
