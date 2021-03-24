/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

if(keyboard_check_pressed(vk_escape))
	room_restart();
	
global.worldSpeedMult = 1.0;
global.paddleSpeedMult = 0.25;
global.ballSpeedMult = 0.75;


if(isGameOver) {
	if(keyboard_check_pressed(ord("X"))) {
		show_debug_message("X Pressed");
		room_restart()
	}
	if(keyboard_check_pressed(ord("Z"))) {
		show_debug_message("Z Pressed");	
		room_restart()
	}
} else {
	if(global.leftScore >= 7 || global.rightScore >= 7) {
		with(objBall) {
			instance_destroy();	
		}
		isGameOver = true;
	}
}