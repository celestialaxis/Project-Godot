extends Control

func _ready():
	if(UserAccess.user_type == UserAccess.Category.STUDENT):
		$UserLabel.text = "Student";
		$VBoxContainer/FirstBtn.text = "Games";
		$VBoxContainer/SecondBtn.text = "Spelling";
	else:
		$UserLabel.text = "Teacher";
		$VBoxContainer/FirstBtn.text = "MakeGame";
		$VBoxContainer/SecondBtn.text = "Orthography";

func _on_FirstBtn_pressed():
	UserAccess.set_screen(UserAccess.Scene.GAME_LIST);

func _on_SecondBtn_pressed():
	if(UserAccess.user_type == UserAccess.Category.TEACHER):
		UserAccess.set_screen(UserAccess.Scene.ADD_EDIT_DELETE);
	if(UserAccess.user_type == UserAccess.Category.STUDENT):
		UserAccess.set_screen(UserAccess.Scene.DISPLAY_GRAPHEME_LIST);


