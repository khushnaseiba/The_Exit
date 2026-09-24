extends Node3D

var player_near = false
var is_open = false
var is_moving = false

@export var open_angle = 90.0
@export var open_speed = 3.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if player_near and Input.is_action_just_pressed("interact") and not is_moving:
		
		if is_open:
			close_door()
		else:
			open_door()
			
func open_door():
	is_open = true
	is_moving = true
	
	var target_rotation = rotation_degrees.y + open_angle
	
	var tween = create_tween()
	
	tween.tween_property(self,"rotation_degrees:y",target_rotation,1.0/open_speed)
	tween.tween_callback(door_finished)
	
func close_door():
	is_open = false
	is_moving = true
	
	var target_rotation = rotation_degrees.y - open_angle
	
	var tween = create_tween()
	
	tween.tween_property(self,"rotation_degrees:y",target_rotation,1.0/open_speed)
	tween.tween_callback(door_finished)
	
func door_finished():
	is_moving = false
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "player":
		player_near = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "player":
		player_near = false
