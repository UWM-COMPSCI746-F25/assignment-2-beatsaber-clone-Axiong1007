extends Node3D
@onready var timer = $"Timer"
@export var dir = Vector3(0,0,1)
@export var speed = 1
var location = -10

func _ready():
	timer.start()
	

func _process(delta):
	global_position += dir * (speed * delta)


func _on_timer_timeout():
	queue_free()
