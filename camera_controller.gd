extends Node3D
# margin is distance of mouse from center for movement of camera
const MOVE_MARGIN = 20
const MOVE_SPEED = 25 

const ZOOM_MARGIN = .3
const ZOOM_SPEED = 25 
const ZOOM_MAX = 1
const ZOOM_MIN = .2

func _init():
	pass

func _process(delta):
	var m_pos = get_viewport().get_mouse_position()
	var obj_pos = position
	calc_move(m_pos, delta)
 
func calc_move(m_pos, delta):
	var v_size = get_viewport().size
	var move_vec = Vector3()
 
	if m_pos.x < MOVE_MARGIN or Input.is_action_pressed("ui_left"):
		move_vec.x -= 1
	if m_pos.y < MOVE_MARGIN or Input.is_action_pressed("ui_up"):
		move_vec.z -= 1
	if m_pos.x > v_size.x - MOVE_MARGIN or Input.is_action_pressed("ui_right"):
		move_vec.x += 1
	if m_pos.y > v_size.y - MOVE_MARGIN or Input.is_action_pressed("ui_down"):
		move_vec.z += 1
		
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation_degrees.y)
	global_translate(move_vec * delta * MOVE_SPEED)
