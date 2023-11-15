extends StaticBody3D

@onready var level = $"../../"
var speed = 5
@export var canMove = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canMove == true:
		position.x -= speed * delta
		if position.x < -15:
			level.SpawnP(position.x + (level.amount * level.offset))
			queue_free()
			level.score += 1
			if speed < 10:
				speed += 0.2
