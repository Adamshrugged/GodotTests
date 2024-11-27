extends Node2D
@export var resourceStuff: Resource
@onready var nameLabel = $Label
@onready var sprite_2d: Sprite2D = $Sprite2D


func setImage(targetImg : String):
	resourceStuff.pic = targetImg
	#sprite_2d.texture = load("res://Images/" + resourceStuff.pic) as Texture2D

func setName(targetName : String):
	resourceStuff.name = targetName
	#nameLabel.text = targetName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture2 = load("res://Images/" + resourceStuff.pic) as Texture2D
	nameLabel.text = resourceStuff.name
	sprite_2d.texture = texture2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
