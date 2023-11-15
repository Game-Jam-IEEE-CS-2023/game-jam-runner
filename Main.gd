extends Node3D

@export var platforms : Array[PackedScene] = []
var amount = 10
var offset = 5
var randN = RandomNumberGenerator.new()
var initials = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func SpawnP(n):
	if initials > 10:
		randN.randomize()
		var m = randN.randi_range(0, platforms.size() - 1)
		var module = platforms[m].instantiate()
		module.position.x = n
		add_child(module)
	else:
		var module = platforms[0].instantiate()
		module.position.x = n
		add_child(module)
		initials += 1
		
	
