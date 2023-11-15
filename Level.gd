extends Node3D

@onready var pNode = $Platforms
@onready var scoreText = $Control/VBoxContainer/Score
@onready var highScoreText = $Control/VBoxContainer/HighScore
@export var platforms : Array[PackedScene] = []
const data_save = "user://savedata.save"
var amount = 10
var offset = 6
var randN = RandomNumberGenerator.new()
var initials = 0
var speed = 10
var score = 0
var highScore = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in amount:
		SpawnP(i * offset)
	score = 0
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Platform(delta)
	scoreText.text = "Score: " + str(score)
	highScoreText.text = "High Score: " + str(highScore)
	if score >= highScore:
		highScore = score
	
func SpawnP(p):
	if initials > 10:
		randN.randomize()
		var m = randN.randi_range(0, platforms.size() - 1)
		var module = platforms[m].instantiate()
		module.position.x = p
		pNode.add_child(module)
	else:
		var module = platforms[0].instantiate()
		module.position.x = p
		pNode.add_child(module)
		initials += 1
		
func Platform(delta):
	for i in pNode.get_children():
		i.position.x -= speed * delta
		if i.position.x < -15:
			SpawnP(position.x + (amount * offset))
			i.queue_free()
