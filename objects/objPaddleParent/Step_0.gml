/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

var movementY = 0;

var ball = instance_nearest(x, y, objBall);

if(ball.y > y) {
	movementY = ball.y - y;
} else if(ball.y < y) {
	movementY = ball.y - y;
}

movementY = clamp(movementY, -maxSpeed, maxSpeed)


y += movementY;