extends Control

@onready var gems_counter = $container/gems_container/gems_counter as Label
@onready var score_counter = $container/score_container/score_counter as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	gems_counter.text = str("%04d" % Global.gems)
	score_counter.text = str("%04d" % Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gems_counter.text = str("%04d" % Global.gems)
	score_counter.text = str("%04d" % Global.score)
	pass
