extends TextureRect
class_name ShopCard2

@export var label: Label
@export var cat2_scene: PackedScene  # Referência para a cena do Cat2

func _on_upgrade_2_pressed() -> void:
	if Global.upgrade_2 == false and Global.fur >= Global.upgrade_2_price:
		Global.upgrade_2 = true 
		Global.fur -= Global.upgrade_2_price
		self.self_modulate = Color(0.3, 0.3, 0.3, 1)  # Escurecendo ainda mais
		
		# Chamar função para adicionar o novo gato
		_spawn_cat2()

func _spawn_cat2() -> void:
	if cat2_scene:

		var cat_instance = cat2_scene.instantiate()  # Criar uma instância do Cat2
		var decoration = get_node("/root/game_level/Decoration")

		if decoration:
			decoration.add_child(cat_instance)
			cat_instance.position = Vector2(190, 1140)  # Define a posição inicial (ajuste conforme necessário)

func _process(delta: float) -> void:
	update_label_text()

func update_label_text() -> void:
	if Global.upgrade_2 == false:
		label.text = "@%s" % Global.upgrade_2_price
	else:
		label.text = "SOLD"
