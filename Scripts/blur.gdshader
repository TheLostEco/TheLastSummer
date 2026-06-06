shader_type canvas_item;

// Grabs the screen with mipmaps enabled (crucial for cheap blur)
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

// Shape Settings
uniform float radius : hint_range(0.0, 2.0) = 0.7; // How far out the effect starts
uniform float softness : hint_range(0.0, 1.0) = 0.4; // How smooth the transition is

// Blur & Color Settings
uniform float max_blur : hint_range(0.0, 5.0) = 2.5; // Max mipmap level (higher = blurrier)
uniform vec4 vignette_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float vignette_opacity : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    float dist = distance(UV, vec2(0.5, 0.5));
    float mask = smoothstep(radius - softness, radius, dist);
    float blur_level = mask * max_blur;
    vec3 screen_color = textureLod(screen_texture, SCREEN_UV, blur_level).rgb;
    vec3 final_color = mix(screen_color, vignette_color.rgb, mask * vignette_opacity);
    COLOR = vec4(final_color, 1.0);
}