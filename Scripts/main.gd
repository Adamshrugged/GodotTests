extends Node2D

var json_names = []
var json_pics = []
var resource_name = ""
var critterScene = load("res://Scenes/critter.tscn")
var critterCount = 0
var critterCountTarget = 3


func getJsonData(location) -> Dictionary:
	#
	var file = FileAccess.open(location, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		var json_result = JSON.parse_string(data)
		file.close()
		return json_result
	return {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Load names from JSON
	json_names = getJsonData("res://Resources/Lists/names.json")["names"]
	json_pics =  getJsonData("res://Resources/Lists/pictures.json")["pictures"]
	
	# Load name from resource file
	var name_resource = load("res://Resources/names.tres") as Resource
	resource_name = name_resource.name

# Choose a random name and return it
func pickName() -> String:
	# Choose a name randomly between JSON and Resource
	return json_names[randi() % json_names.size()]

func pickImage() -> String:
	return json_pics[randi() % json_pics.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass

func createCritter():
	# instantiate a critter
	var critter_instance = critterScene.instantiate()
	# set the name
	var newName = pickName()
	critter_instance.setName( newName )
	critter_instance.setImage( pickImage() )
	# adjust location
	critter_instance.position = Vector2( critterCount * 140, 0)
	# add as child
	add_child(critter_instance)
	
	critterCount += 1

func _on_button_pressed() -> void:
	createCritter()
