shader_type canvas_item;

uniform sampler2D fire;
uniform sampler2D noise;
void fragment() {
	vec2 uv = UV;
	uv = uv-1.0;
	vec4 texture_color = texture(noise, UV);
	COLOR.rgb = texture_color.rgb;

}
