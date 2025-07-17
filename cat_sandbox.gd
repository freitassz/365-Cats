extends Node2D


func _process(delta: float) -> void:
	if Global.upgrade_4 == true:
		self.visible = true
	else:
		self.visible = false
