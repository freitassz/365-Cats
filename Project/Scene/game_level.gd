extends Node2D


@onready var canvas_layer = $DayNightFilter/CanvasLayer
@onready var canvas_modulate = $DayNightFilter
@onready var ui = $DayNightFilter/CanvasLayer/DayNightHud



func _ready() -> void:
	canvas_layer.visible = true
	canvas_modulate.time_tick.connect(ui.set_daytime)
