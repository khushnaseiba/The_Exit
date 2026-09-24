extends Node3D

@onready var message = $CanvasLayer/Label
@onready var timer = $Timer
@onready var door = $Realexitdoor
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	message.visible = false
	door.visible = false
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	message.text = "there's something in your bedroom"
	message.visible = true
	door.visible = true
	
	await get_tree().create_timer(5.0).timeout
	message.visible=false
