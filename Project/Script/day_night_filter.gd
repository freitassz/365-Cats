extends CanvasModulate

const DayMinutes = 1440  # Quantidade total de minutos em um dia (24h * 60min)
const HourMinutes = 60  # Minutos em uma hora
const RealTimeMinute = (2 * PI) / DayMinutes  # Conversão de tempo do jogo para um ciclo de 24h


signal time_tick(day:int, hour:int, minute:int)

@export var gradient_inside:GradientTexture1D
@export var gradient_outside:GradientTexture1D
@export var GameSpeed = 1
@export var StartHour = 6:
	set(h):
		StartHour = h
		time = RealTimeMinute * HourMinutes * StartHour

var gradient_used
var time:float= 0.0
var past_minute:int= -1


func _ready() -> void:
	time = RealTimeMinute * HourMinutes * StartHour


func _process(delta: float) -> void:
	if Global.inside:
		gradient_used = gradient_inside
	else:
		gradient_used = gradient_outside
	
	
	time += delta * RealTimeMinute * GameSpeed
	
	var value = (sin(time - PI / 2.0) + 1.0) / 2.0
	self.color = gradient_used.gradient.sample(value)
	
	_recalculate_time()

func _recalculate_time() -> void:
	var total_minutes = int(time / RealTimeMinute)
	
	var day = int(total_minutes / DayMinutes)
	
	var CurrentMinutes = total_minutes % DayMinutes
	
	var hour = int(CurrentMinutes / HourMinutes)
	var minute = int(CurrentMinutes % HourMinutes)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)
