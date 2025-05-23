#define WAVES 10.
#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;

void main(void){
    vec2 centered_coord = ( 2. * gl_FragCoord.xy - resolution.xy ) / resolution.y;
    float dist_from_center = length(centered_coord);
    float dist_from_center_y = length(centered_coord.y);
    float u = 6./dist_from_center_y + time * 4.;
    float v = (6./dist_from_center_y) * centered_coord.x;
    float grid = (1. - pow(sin(u) + 1., .1) + (1.0 - pow(sin(v) + 1., .1))) * dist_from_center_y *3.;
    gl_FragColor=vec4(vec3(grid)*vec3(.2,.6,1.9),1.);
}