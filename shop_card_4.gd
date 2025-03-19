extends TextureRect
class_name ShopCard4

@export var label: Label
@export var sandbox_scene: PackedScene  # Referência para a cena do Cat2

func _on_upgrade_4_pressed() -> void:
	if Global.upgrade_4 == false and Global.fur >= Global.upgrade_4_price:
		Global.upgrade_4 = true 
		Global.fur -= Global.upgrade_4_price
		self.self_modulate = Color(0.3, 0.3, 0.3, 1)  # Escurecendo ainda mais
		
		_sandbox_spawn()

func _sandbox_spawn() -> void:
	if sandbox_scene:

		var sandbox_instance = sandbox_scene.instantiate()  # Criar uma instância do Cat2
		var decoration = get_node("/root/game_level/Decoration")

		if decoration:
			decoration.add_child(sandbox_instance)
			sandbox_instance.position = Vector2(213, 1067)  # Define a posição inicial (ajuste conforme necessário)

func _process(delta: float) -> void:
		update_label_text()

func update_label_text() -> void:
	if Global.upgrade_4 == false:
		label.text = "@%s" %Global.upgrade_4_price
	else:
		label.text = "SOLD"
