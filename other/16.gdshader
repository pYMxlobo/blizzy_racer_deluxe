
shader_type canvas_item;

uniform vec4 color_0 : source_color = vec4(1,1,1,1);
uniform vec4 color_1 : source_color = vec4(0.7607843137254902,0.7607843137254902,0.7607843137254902,1);
uniform vec4 color_2 : source_color = vec4(0,0,0,1);
uniform vec4 color_3 : source_color = vec4(0.3686274509803922,0.3686274509803922,0.3686274509803922,1);
uniform vec4 color_4 : source_color = vec4(1,0,0,1);
uniform vec4 color_5 : source_color = vec4(1,0,0.6666666666666666,1);
uniform vec4 color_6 : source_color = vec4(1,1,0,1);
uniform vec4 color_7 : source_color = vec4(1,0.6352941176470588,0,1);
uniform vec4 color_8 : source_color = vec4(0,1,0,1);
uniform vec4 color_9 : source_color = vec4(0.4666666666666667,1,0,1);
uniform vec4 color_10 : source_color = vec4(0,1,1,1);
uniform vec4 color_11 : source_color = vec4(0,1,0.7333333333333333,1);
uniform vec4 color_12 : source_color = vec4(0,0,1,1);
uniform vec4 color_13 : source_color = vec4(0,0.3333333333333333,1,1);
uniform vec4 color_14 : source_color = vec4(1,0,1,1);
uniform vec4 color_15 : source_color = vec4(0.4,0,1,1);


uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;


vec3 rgb_to_yuv(vec4 rgba) {
    float R = rgba.r;
	float G = rgba.g;
	float B = rgba.b;
    float Y = 0.299 * R + 0.587 * G + 0.114 * B;
    float U = -0.147 * R - 0.289 * G + 0.436 * B;
    float V = 0.615 * R - 0.515 * G - 0.100 * B;
    return vec3(Y, U, V);
}


void fragment() {

	vec4 colors[16] = {color_0,color_1,color_2,color_3,color_4,color_5,color_6,color_7,color_8,color_9,color_10,color_11,color_12,color_13,color_14,color_15};
	float smallest_difference = -1.0;
	vec4 min_color = vec4(0.0, 0.0, 0.0, 1.0);

	vec2 uv = SCREEN_UV;

	vec4 temp = textureLod(SCREEN_TEXTURE, uv, 0.0);

	smallest_difference = 1000.0;
	for (int i = 0; i < colors.length(); i++) {

		

		float curr_dist = distance(rgb_to_yuv(colors[i]), rgb_to_yuv(temp));
		
		if (curr_dist < smallest_difference) {
			smallest_difference = curr_dist;
			min_color = colors[i];
		}
	}

	COLOR.rgb = min_color.rgb;
}
