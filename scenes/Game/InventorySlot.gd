extends Button

var contents = []

func add_contents(what):
	contents.append(what)
	what.inventory_slot = self
	update_slot()
	

func remove_contents(what):
	contents.remove(contents.find(what))
	what.inventory_slot = null
	update_slot()


func update_slot():
	if not contents.empty():
		get_node('Icon').set_texture(contents[0].get_icon())
		set_disabled(false)
	else:
		get_node('Icon').set_texture(null)
		set_disabled(true)

	var count = contents.size()
	var txt = str(count) if count > 1 else ''
	get_node('Count').set_text(txt)



func _ready():
	connect("mouse_enter", get_parent(), "_on_slot_mouse_enter", [self])
	connect("mouse_exit", get_parent(), "_on_slot_mouse_exit")
