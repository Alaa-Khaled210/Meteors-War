extends Control

@onready var option_button: OptionButton = $HBoxContainer/OptionButton

const RESOLUTION_DICTIONARY : Dictionary ={
	"1152 x 648": Vector2i(1152,648),
	"1280 x 720": Vector2i(1280,720),
	"1920 x 1080": Vector2i(1920,1080),
}

func _ready() -> void:
	add_resolution_item()
	
	
	
func _on_option_button_item_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	
	
func add_resolution_item()-> void:
	for resolution_sizetxt in RESOLUTION_DICTIONARY :
		option_button.add_item(resolution_sizetxt)
