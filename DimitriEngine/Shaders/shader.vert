#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 Normal;
out vec3 FragPos;


uniform mat4 view;
uniform mat4 projection;
uniform mat4 model;

//uniform mat4 transform;

#define max_instances 100
uniform mat4 transforms[max_instances];

void main()
{
    TexCoords = aTexCoords;    
	Normal = aNormal;
    mat4 transform = transforms[gl_InstanceID];
    FragPos = vec3((model * transform) * vec4(aPos, 1.0));
    gl_Position = projection * view * model * transform * vec4(aPos, 1.0);
}