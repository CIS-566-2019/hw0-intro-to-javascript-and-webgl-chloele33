#version 300 es

precision highp float;

uniform float u_Time;

uniform mat4 u_Model;
uniform mat4 u_ModelInvTr;
uniform mat4 u_ViewProj;

in vec4 vs_Pos;
in vec4 vs_Nor;
in vec4 vs_Col;

out vec4 fs_Pos;

out vec4 fs_Nor;
out vec4 fs_Col;
const vec4 lightPos = vec4(5, 5, 3, 1);

void main()
{
    fs_Col = vs_Col;

    mat3 invTranspose = mat3(u_ModelInvTr);
    fs_Nor = vec4(invTranspose * vec3(vs_Nor), 0);


    vec4 modelposition = u_Model * vs_Pos;   // Temporarily store the transformed vertex positions for use below

    //modelposition += vec4(sin(u_Time * 3.14/5.0f),
    //                      cos(u_Time * 3.14/5.0f),
    //                     tan(u_Time * 3.14/5.0f),
    //                     0);


    fs_Pos = u_ViewProj * modelposition;

    gl_Position = u_ViewProj * modelposition;// gl_Position is a built-in variable of OpenGL which is
                                             // used to render the final positions of the geometry's vertices
}
