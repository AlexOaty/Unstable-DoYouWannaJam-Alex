extends Node2D

var wall = preload("res://Scenes/wall.tscn")
var ceiling = preload("res://Scenes/ceiling.tscn") 

var border = null

var wallCount = 0
var ceilingCount = 0

var wallLimit = 8
var ceilingLimit = 4
var limit = 0
var count = 0

var parts = []

var selected = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected = null
	border = $Border
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and selected != null and get_global_mouse_position().y < border.position.y:
		if selected == wall and wallCount < wallLimit:
			spawnSelected()
			wallCount += 1
		if selected == ceiling and ceilingCount < ceilingLimit:
			spawnSelected()
			ceilingCount += 1
	pass

func spawnSelected() -> void:
	var instance = selected.instantiate()
	add_child(instance)
	instance.position =  get_global_mouse_position()
	parts.append(instance)
	

func _on_wallButton_pressed() -> void:
	selected = wall
	pass # Replace with function body.


func _on_ceiling_button_pressed() -> void:
	selected = ceiling
	pass # Replace with function body.


func _on_clear_button_pressed() -> void:
	selected = null
	pass # Replace with function body.


func _on_reset_button_pressed() -> void:
	wallCount = 0
	ceilingCount = 0
	for part in parts:
		part.free()
	parts = []
	pass # Replace with function body.
