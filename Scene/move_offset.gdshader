shader_type canvas_item;

void vertex() {
	VERTEX.y = VERTEX.y + 5.0;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
