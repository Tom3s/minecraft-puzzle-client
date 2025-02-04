@tool
extends CenterContainer
class_name Clue

@onready var grid_container: GridContainer = %GridContainer
@onready var item_select_ui: ItemSelectUI = %ItemSelectUI

@onready var editing_button: CheckButton = %EditingButton
@onready var print_button: Button = %PrintButton

@export
var editing: bool = true:
	set(new_value):
		editing = on_editing_changed(new_value)

@export
var cells: Array[Enums.Item] = \
[
	Enums.Item.NONE,
	Enums.Item.NONE,
	Enums.Item.NONE,

	Enums.Item.NONE,
	Enums.Item.NONE,
	Enums.Item.NONE,
	
	Enums.Item.NONE,
	Enums.Item.NONE,
	Enums.Item.NONE,
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# render_clue()
	generate_buttons()

	editing_button.toggled.connect(func(new_value: bool) -> void:
		editing = new_value
	)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_editing_changed(new_value: bool) -> bool:
	#  do stuff
	if new_value == false:
		render_clue()
	else:
		generate_buttons()
	return new_value

func render_clue() -> void:
	if grid_container == null:
		return

	for child in grid_container.get_children():
		# remove not necessary?
		child.queue_free()


	for item in cells:
		var control: CenterContainer = CenterContainer.new()
		control.custom_minimum_size = Vector2(72, 72)
		# control.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		# control.size_flags_vertical = Control.SIZE_SHRINK_CENTER

		grid_container.add_child(control)

		if item == Enums.Item.NONE:
			continue
		
		var bg: TextureRect = TextureRect.new()
		bg.texture = load("res://textures/stone.png")
		bg.custom_minimum_size = Vector2(72, 72)

		control.add_child(bg)

		if item == Enums.Item.EMPTY:
			continue
		
		var item_name: String = Enums.Item.keys()[item].to_lower()
		print(item_name)

		var item_texture: TextureRect = TextureRect.new()
		item_texture.texture = load("res://textures/" + item_name + ".png")
		item_texture.custom_minimum_size = Vector2(64, 64)

		control.add_child(item_texture)

func generate_buttons() -> void:
	if grid_container == null:
		return

	for child in grid_container.get_children():
		# remove not necessary?
		child.queue_free()
	
	var index: int = 0
	for item in cells:
		var button: Button = Button.new()
		button.custom_minimum_size = Vector2(72, 72)
		button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.expand_icon = true

		button.pressed.connect(func() -> void:
			item_select_ui.visible = true
			
			item_select_ui.item_selected.connect(func(item_name: Enums.Item) -> void:
				cells[index] = item_name
				on_editing_changed(editing)
				item_select_ui.visible = false

				var connections: Array[Dictionary]
				connections.assign(item_select_ui.item_selected.get_connections())

				for conn in connections:
					item_select_ui.item_selected.disconnect(conn.callable)
			)

			
		)


		if item == Enums.Item.NONE:
			button.icon = null
			button.text = "NONE"
		elif item == Enums.Item.EMPTY:
			button.icon = load("res://textures/stone.png")
			button.text = "EMPTY"
		else:
			var item_name: String = Enums.Item.keys()[item].to_lower()
			button.icon = load("res://textures/" + item_name + ".png")

		grid_container.add_child(button)

		index += 1