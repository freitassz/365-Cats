extends Node2D


func _process(delta: float) -> void:
	if Global.upgrade_1 == true:
		self.visible = true
	else:
		self.visible = false
