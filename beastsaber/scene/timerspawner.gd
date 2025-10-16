extends Node3D
@onready var timer1 = $"Timer 1"
@onready var timer2 = $"Timer 2"
@onready var blue = load("res://scene/blueblock.tscn")
@onready var red = load("res://scene/block.tscn")

@export var xrange = Vector2(-1.0,1.0)
@export var yrange = Vector2(1.0,1.7)

func _ready():
	start_random_timer1()
	start_random_timer2()
	
func start_random_timer1():
	var waittime = randf_range(.5,2)
	timer1.start(waittime)
func start_random_timer2():
	var waittime = randf_range(.5,2)
	timer2.start(waittime)

func _on_timer_1_timeout():
	var instance = blue.instantiate()
	add_child(instance)
	instance.global_position = get_random_position()
	start_random_timer1()

func _on_timer_2_timeout():
	var instance = red.instantiate()
	add_child(instance)
	instance.global_position = get_random_position()
	start_random_timer2()
	
func get_random_position():
	var randomx = randf_range(xrange.x, xrange.y)
	var randomy = randf_range(yrange.x, yrange.y)
	return Vector3(randomx, randomy, -10)
