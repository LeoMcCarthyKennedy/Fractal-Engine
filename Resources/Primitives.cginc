#ifndef PRIMITIVES
#define PRIMITIVES

// ****************** primitive data

struct Primitive {
	float3 position;
	float3 rotation;
	float3 scale;

	int type;
	float3 parameters;

	float shine;
	float reflectiveness;

	float3 color;
};

// ****************** distances

// credit to https://iquilezles.org/articles/distfunctions/

float GetSphereDistance(float4 p, float parameter) {
	return (length(p.xyz) - parameter) / p.w;
}

float GetBoxDistance(float4 p, float3 parameters) {
	float3 q = abs(p.xyz) - parameters;

	return (min(max(max(q.x, q.y), q.z), 0) + length(max(q, 0))) / p.w;
}

float GetTorusDistance(float4 p, float2 parameters) {
	float2 q = float2(length(p.xz) - parameters.x, p.y);

	return (length(q) - parameters.y) / p.w;
}

float GetCylinderDistance(float4 p, float2 parameters) {
	float2 q = abs(float2(length(p.xz), p.y)) - parameters;

	return (min(max(q.x, q.y), 0) + length(max(q, 0))) / p.w;
}

float GetTetrahedronDistance(float4 p, float parameter) {
	float q = max(max(max(-p.x - p.y - p.z, p.x + p.y - p.z), -p.x + p.y + p.z), p.x - p.y + p.z);

	return (q - parameter) / (p.w * sqrt(3));
}

#endif