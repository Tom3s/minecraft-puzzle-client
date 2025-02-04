extends PanelContainer
class_name ItemSelectUI

@onready var iron_sword_button: Button = %IronSwordButton
@onready var iron_pickaxe_button: Button = %IronPickaxeButton
@onready var iron_chestplate_button: Button = %IronChestplateButton

@onready var gold_sword_button: Button = %GoldSwordButton
@onready var gold_pickaxe_button: Button = %GoldPickaxeButton
@onready var gold_chestplate_button: Button = %GoldChestplateButton

@onready var diamond_sword_button: Button = %DiamondSwordButton
@onready var diamond_pickaxe_button: Button = %DiamondPickaxeButton
@onready var diamond_chestplate_button: Button = %DiamondChestplateButton

@onready var iron_button: Button = %IronButton
@onready var gold_button: Button = %GoldButton
@onready var diamond_button: Button = %DiamondButton
@onready var sword_button: Button = %SwordButton
@onready var pickaxe_button: Button = %PickaxeButton
@onready var chestplate_button: Button = %ChestplateButton

@onready var empty_button: Button = %EmptyButton
@onready var none_button: Button = %NoneButton

signal item_selected(item: Enums.Item)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	iron_sword_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.IRON_SWORD)
	)
	iron_pickaxe_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.IRON_PICKAXE)
	)
	iron_chestplate_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.IRON_CHESTPLATE)
	)
	gold_sword_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.GOLD_SWORD)
	)
	gold_pickaxe_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.GOLD_PICKAXE)
	)
	gold_chestplate_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.GOLD_CHESTPLATE)
	)
	diamond_sword_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.DIAMOND_SWORD)
	)
	diamond_pickaxe_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.DIAMOND_PICKAXE)
	)
	diamond_chestplate_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.DIAMOND_CHESTPLATE)
	)
	iron_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.IRON)
	)
	gold_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.GOLD)
	)
	diamond_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.DIAMOND)
	)
	sword_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.SWORD)
	)
	pickaxe_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.PICKAXE)
	)
	chestplate_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.CHESTPLATE)
	)
	empty_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.EMPTY)
	)
	none_button.pressed.connect(func() -> void:
		item_selected.emit(Enums.Item.NONE)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# keep container sizes consistent
	pass
