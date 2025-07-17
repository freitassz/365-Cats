extends TextureRect
class_name ShopCard3

@export var label: Label
@export var poster_scene: PackedScene  

func _on_upgrade_3_pressed() -> void:
	if Global.upgrade_3 == false and Global.fur >= Global.upgrade_3_price:
		Global.upgrade_3 = true 
		Global.fur -= Global.upgrade_3_price
		self.self_modulate = Color(0.3, 0.3, 0.3, 1)  # Escurecendo ainda mais
		
		_spawn_poster()

func _spawn_poster() -> void:
	if poster_scene:

		var poster_instance = poster_scene.instantiate()  # Criar uma instância
		var decoration = get_node("/root/game_level/Decoration")

		if decoration:
			decoration.add_child(poster_instance)
			poster_instance.position = Vector2(145, 1050)  # Ajuste conforme necessário


func _process(delta: float) -> void:
		update_label_text()

func update_label_text() -> void:
	if Global.upgrade_3 == false:
		label.text = "@%s" %Global.upgrade_3_price
	else:
		label.text = "SOLD"
