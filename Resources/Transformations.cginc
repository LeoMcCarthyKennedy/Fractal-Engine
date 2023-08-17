#ifndef TRANSFORMATIONS
#define TRANSFORMATIONS

// ****************** position transformations

void Translate(inout float4 p, float3 translation) {
	p.xyz += translation;
}

// ****************** rotation transformations

float2x2 GetRotationMatrix(float angle) {
	float c = cos(angle);
	float s = sin(angle);

	return float2x2(c, -s, s, c);
}

void RotateX(inout float4 p, float angle) {
	p.yz = mul(p.yz, GetRotationMatrix(angle));
}

void RotateY(inout float4 p, float angle) {
	p.xz = mul(p.xz, GetRotationMatrix(-angle));
}

void RotateZ(inout float4 p, float angle) {
	p.xy = mul(p.xy, GetRotationMatrix(angle));
}

void Rotate(inout float4 p, float3 rotation) {
	RotateX(p, rotation.x);
	RotateY(p, rotation.y);
	RotateZ(p, rotation.z);
}

// ****************** scale transformations

void Scale(inout float4 p, float scale) {
	p *= scale;
}

void Scale(inout float4 p, float3 scale) {
	p.xyz *= scale;
	p.w *= max(max(scale.x, scale.y), scale.z);
}

// ****************** fractal transformations

// credit to https://github.com/HackerPoet/PySpace/blob/master/pyspace/frag.glsl

void AbsFold(inout float4 p) {
	p.xyz = abs(p.xyz);
}

void PlaneFold(inout float4 p, float3 normal, float distance) {
	p.xyz -= 2 * min(dot(p.xyz, normal) - distance, 0) * normal;
}

void SphereFold(inout float4 p, float minRadius, float maxRadius) {
	p *= max(maxRadius / max(minRadius, dot(p.xyz, p.xyz)), 1);
}

void BoxFold(inout float4 p, float3 size) {
	p.xyz = 2 * clamp(p.xyz, -size, size) - p.xyz;
}

void MengerFold(inout float4 p) {
	float q = min(p.x - p.y, 0);

	p.x -= q;
	p.y += q;

	q = min(p.x - p.z, 0);

	p.x -= q;
	p.z += q;

	q = min(p.y - p.z, 0);

	p.y -= q;
	p.z += q;
}

void SierpinskiFold(inout float4 p) {
	p.xy -= min(p.x + p.y, 0);
	p.xz -= min(p.x + p.z, 0);
	p.yz -= min(p.y + p.z, 0);
}

#endif