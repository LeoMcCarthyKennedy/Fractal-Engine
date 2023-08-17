#ifndef RAY
#define RAY

// credit to http://blog.three-eyed-games.com/2018/05/03/gpu-ray-tracing-in-unity-part-1

struct Ray {
	float3 origin;
	float3 direction;
};

// ****************** ray constructors

Ray CreateRay(float3 origin, float3 direction) {
	Ray ray;
	ray.origin = origin;
	ray.direction = normalize(direction);

	return ray;
}

Ray CreateCameraRay(float3 cameraPosition, float4x4 cameraToWorldMatrix, float4x4 cameraProjectionMatrixInverse, float2 uv) {
	float3 origin = cameraPosition;
	float3 direction = mul(cameraToWorldMatrix, float4(mul(cameraProjectionMatrixInverse, float4(uv, 0, 1)).xyz, 0)).xyz;

	return CreateRay(origin, direction);
}

#endif