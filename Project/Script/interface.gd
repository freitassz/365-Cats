extends Control
class_name InterfaceClicker

@export var label: Label

func _ready() -> void:
	update_label_text()

func _process(delta: float) -> void:
	if Global.fur:
		update_label_text()

func update_label_text() -> void:
	label.text = "@:%s" %Global.fur
