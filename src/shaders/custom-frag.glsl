#version 300 es

precision highp float;

uniform float u_Time;

uniform vec4 u_Color; // The color with which to render this instance of geometry.

in vec4 fs_Pos;
in vec4 fs_Nor;
in vec4 fs_Col;

out vec4 out_Col; // This is the final output color that you will see on your
                  // screen for the pixel that is currently being processed.

void main()
{
    // Compute final shaded color
    //out_Col = vec4(diffuseColor.rgb * lightIntensity, diffuseColor.a);

    //Copy the color; there is no shading.
    //out_Col = u_Color * vec4(u_Time * 5.0 / 100.0, 1, 0, 1); //fs_Col;

    vec4 color = u_Color * vec4(sin(u_Time * fs_Pos.xyz), 1);
    out_Col = color;
}
