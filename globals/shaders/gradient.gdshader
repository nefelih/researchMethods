shader_type spatial;

uniform vec3 light_color : source_color = vec3(1.0, 1.0, 1.0);
uniform vec3 dark_color : source_color = vec3(0.05, 0.05, 0.05);
uniform float inner_radius = 0.0;
uniform float outer_radius = 1.0;

varying vec3 local_pos;

void vertex() {
	local_pos = VERTEX;
}

void fragment() {
	float dist = length(local_pos);
	float t = smoothstep(inner_radius, outer_radius, dist);
	ALBEDO = mix(light_color, dark_color, t);
}
