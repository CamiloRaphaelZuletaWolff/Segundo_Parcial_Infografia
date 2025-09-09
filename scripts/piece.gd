extends Node2D

@export var color: String
var type := "normal"
var matched := false

# movimiento: uso create_tween con curva distinta (misma idea funcional)
func move(target:Vector2) -> void:
	var tw = get_tree().create_tween()
	tw.tween_property(self, "position", target, 0.4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

# visual helpers
func dim() -> void:
	$Sprite2D.modulate = Color(1, 1, 1, 0.5)

func normal() -> void:
	$Sprite2D.modulate = Color(1, 1, 1, 1)

# construye nombre legible para archivo desde color (maneja "light_green")
func _readable_name(col:String) -> String:
	if col == "light_green":
		return "Light Green"
	# reemplazar '_' por ' ' y capitalizar cada palabra
	var parts = col.split("_")
	for i in range(parts.size()):
		parts[i] = parts[i].capitalize()
	return " ".join(parts)

func newSprite(isVertical:bool) -> void:
	var name = _readable_name(color)
	if isVertical:
		type = "Column"
	else:
		type = "Row"
	var image_path = "res://assets/pieces/%s %s.png" % [name, type]
	$Sprite2D.texture = load(image_path)

func newSpriteFive() -> void:
	var name = _readable_name(color)
	type = "Adjacent"
	var image_path = "res://assets/pieces/%s %s.png" % [name, type]
	$Sprite2D.texture = load(image_path)
