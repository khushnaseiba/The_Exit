extends Area3D

@onready var message = $"../../CanvasLayer2/Label"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	message.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	pass

func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		message.text = "walk straight to the exit room"
		message.visible = true
