extends Node

@export var wArray : Array[PackedScene] = []

@onready var Menu = $Control
@onready var bPlay = $Control/VBoxContainer/Play
@onready var world = $Node3D
var randNum = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnW()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Level.tscn") # Replace with function body.
	
func spawnW():
	randNum.randomize()
	var m = randNum.randi_range(0, wArray.size() - 1)
	var module = wArray[m].instantiate()
	module.rotation.y = 90
	module.canMove = false
	world.add_child(module)
