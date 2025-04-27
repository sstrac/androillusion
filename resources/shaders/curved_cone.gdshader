shader_type canvas_item;
render_mode unshaded;

//void fragment() {
	////if (UV.x > 0.5)
	//ALBEDO.a = 0.0;
//}
const float RADIUS = 0.5;
const vec2 CENTER = vec2(0.5, 0.5);

void fragment() {
	float dist = sqrt(pow(CENTER.x - UV.x, 2) + pow(CENTER.y - UV.y, 2));
	if(dist > RADIUS || UV.x < 0.85)
		COLOR.a = 0.0;
	if(UV.y > 0.3 && UV.y < 0.7)
		COLOR.a = 1.0;

}