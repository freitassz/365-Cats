extends Control

@onready var arrow: TextureRect = %Arrow

func set_daytime(day: int, hour: int, minute: int) -> void:
	# Mapeia as horas de 0 a 24 para um intervalo de 0 a 180 graus
	var rotation = _remap_rangef(hour, 0, 24, -180, 0)
	arrow.rotation_degrees = rotation

func _remap_rangef(input: float, minInput: float, maxInput: float, minOutput: float, maxOutput: float) -> float:
	return float(input - minInput) / float(maxInput - minInput) * float(maxOutput - minOutput) + minOutput
