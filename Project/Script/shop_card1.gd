extends TextureRect
class_name ShopCard1

@export var label: Label
@export var bowl_scene: PackedScene  # Referência para a cena do Cat2

func _on_upgrade_1_pressed() -> void:
	if Global.upgrade_1 == false and Global.fur >= Global.upgrade_1_price:
		Global.upgrade_1 = true 
		Global.fur -= Global.upgrade_1_price
		self.self_modulate = Color(0.3, 0.3, 0.3, 1)  # Escurecendo ainda mais
		
		_bowl_spawn()

func _bowl_spawn() -> void:
	if bowl_scene:

		var bowl_instance = bowl_scene.instantiate()  # Criar uma instância do Cat2
		var decoration = get_node("/root/game_level/Decoration")

		if decoration:
			decoration.add_child(bowl_instance)
			bowl_instance.position = Vector2(117, 1067)  # Define a posição inicial (ajuste conforme necessário)

func _process(delta: float) -> void:
		update_label_text()

func update_label_text() -> void:
	if Global.upgrade_1 == false:
		label.text = "@%s" %Global.upgrade_1_price
	else:
		label.text = "SOLD"
