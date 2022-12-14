extends Control

func _ready():
	if(UserAccess.user_type == UserAccess.Category.STUDENT):
		$ChangeBtn.hide();
		$UserLabel.text = "Siswa";
	else:
		$ChangeBtn.show();
		$UserLabel.text = "Guru";
	
	if(UserAccess.ref_selected_item != null):
		$HBoxContainer/VBoxContainer/WordLabel.text = UserAccess.ref_selected_item.text;
		$HBoxContainer/VBoxContainer/SpellingLabel.text = PoolStringArray(UserAccess.ref_selected_item.spelling).join("-");
		$HBoxContainer/VBoxContainer/TypeLabel.text = UserAccess.ref_selected_item.type;
		if(UserAccess.ref_selected_item.text_image != null):
			$HBoxContainer/VBoxContainer2/Image.texture = UserAccess.ref_selected_item.text_image;
		if(UserAccess.ref_selected_item):
			$HBoxContainer/VBoxContainer2/PronounceSound.stream = UserAccess.ref_selected_item.pronounce;

func _on_ChangeBtn_pressed():
	UserAccess.set_screen(UserAccess.Scene.GRAPHEME_FORM);

func _on_PlayBtn_pressed():
	$HBoxContainer/VBoxContainer2/PronounceSound.volume_db = 20;
	$HBoxContainer/VBoxContainer2/PronounceSound.stop();
	$HBoxContainer/VBoxContainer2/PronounceSound.play();
