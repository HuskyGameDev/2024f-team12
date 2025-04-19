extends Node2D

enum pinstate{
	unpressed,
	pressed,
	unlocked
}

@onready var pinOne = $StaticBody2D/LockpickGame/PinOne
@onready var pinTwo = $StaticBody2D/LockpickGame/PinTwo
@onready var pinThree = $StaticBody2D/LockpickGame/PinThree
@onready var pinFour = $StaticBody2D/LockpickGame/PinFour
@onready var pinFive = $StaticBody2D/LockpickGame/PinFive
@onready var pinSix = $StaticBody2D/LockpickGame/PinSix

var pinstates = [pinstate.unpressed, pinstate.unpressed, pinstate.unpressed, pinstate.unpressed, pinstate.unpressed, pinstate.unpressed]

var correctorder = [2, 1, 6, 4, 5, 3]
var curcorrect = 0
var curwrong = 0

func _ready() -> void:
	correctorder.shuffle()
	reset_pins()

func reset_pins():
	curcorrect = 0
	curwrong = 0
	for i in range(6):
		pinstates[i] = pinstate.unpressed
		var updater = i + 1
		_update_sprites(updater)

func _pin_one_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(1)

func _pin_one_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(1)

func _pin_two_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(2)

func _pin_two_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(2)

func _pin_three_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(3)

func _pin_three_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(3)

func _pin_four_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(4)

func _pin_four_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(4)

func _pin_five_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(5)

func _pin_five_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(5)

func _pin_six_entered(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(6)

func _pin_six_exited(body: Node2D) -> void:
	if body == $LockpickLockpick:
		_rotate_state(6)

func _rotate_state(pin):
	pin = pin - 1
	match pinstates[pin]:
		pinstate.unpressed:
			$Try.play()
			pinstates[pin] = pinstate.pressed
		pinstate.pressed:
			$Release.play()
			if correctorder[curcorrect] == pin + 1:
				pinstates[pin] = pinstate.unlocked
				curcorrect = curcorrect + 1
				if curcorrect == 6:
					$Success.play()
					$LockpickLockpick.playtime = false
					$"..".lockpickmode = false
			else:
				for i in range(curcorrect):
					if correctorder[i] == pin + 1:
						pinstates[pin] = pinstate.unlocked
				if pinstates[pin] != pinstate.unlocked:
					curwrong += 1
					pinstates[pin] = pinstate.unpressed
					if curwrong == 5:
						$Fail.play()
						reset_pins()
		pinstate.unlocked:
			$Try.play()
			pinstates[pin] = pinstate.pressed
	
	pin = pin + 1
	_update_sprites(pin)

func _update_sprites(pinnum):
	var curpin = $StaticBody2D/LockpickGame/PinOne
	
	match pinnum:
		1: 
			curpin = $StaticBody2D/LockpickGame/PinOne
		2: 
			curpin = $StaticBody2D/LockpickGame/PinTwo
		3: 
			curpin = $StaticBody2D/LockpickGame/PinThree
		4: 
			curpin = $StaticBody2D/LockpickGame/PinFour
		5: 
			curpin = $StaticBody2D/LockpickGame/PinFive
		6: 
			curpin = $StaticBody2D/LockpickGame/PinSix
	
	pinnum = pinnum - 1
	
	match pinstates[pinnum]:
		pinstate.unpressed:
			curpin.frame = 0
		pinstate.pressed:
			curpin.frame = 1
		pinstate.unlocked:
			curpin.frame = 2
