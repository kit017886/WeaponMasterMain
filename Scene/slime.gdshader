shader_type canvas_item;

uniform bool switich = false;
uniform vec3 unifomr_color : source_color;

void vertex(){
}

void fragment() {
	if (switich == true) {
		vec4 texture_color = texture(TEXTURE, UV);
		COLOR = vec4(unifomr_color, texture_color.a);
		}
}

