
shader_type canvas_item;

uniform vec4 color_0 : source_color = vec4(1,1,1,1);
uniform vec4 color_1 : source_color = vec4(0,0,0,1);


uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;



void fragment() {

	vec4 colors[2] = {color_0,color_1};
	float smallest_difference = -1.0;
	vec4 min_color = vec4(0.0, 0.0, 0.0, 1.0);

	vec2 uv = SCREEN_UV;

	vec4 temp = textureLod(SCREEN_TEXTURE, uv, 0.0);

	smallest_difference = 1000.0;
	for (int i = 0; i < colors.length(); i++) {

		

		float curr_dist = distance(colors[i], temp);
		
		if (curr_dist < smallest_difference) {
			smallest_difference = curr_dist;
			min_color = colors[i];
		}
	}

	COLOR.rgb = min_color.rgb;
}
