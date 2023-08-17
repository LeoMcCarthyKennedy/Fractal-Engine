#include "OrbitTrap.cginc"
#include "Primitives.cginc"
#include "Transformations.cginc"

#ifndef FRACTALS
#define FRACTALS

// ****************** distances

float GetMandelbulbDistance(float4 p, float3 parameters) {
	// credit to http://blog.hvidtfeldts.net/index.php/2011/09/distance-estimated-3d-fractals-v-the-mandelbulb-different-de-approximations/

	float3 z = p.xyz;

	float dr = 1.0;
	float r = 0.0;

	for (int i = 0; i < MANDELBULB_ITERATIONS; i++) {
		r = length(z);

		if (r > 2) break;

		// convert to polar coordinates
		float theta = acos(z.z / r);
		float phi = atan2(z.y, z.x);

		dr = pow(r, parameters.x - 1.0) * parameters.x * dr + 1.0;

		// scale and rotate the point
		float zr = pow(r, parameters.x);
		theta = theta * parameters.x;
		phi = phi * parameters.x;

		// convert back to cartesian coordinates
		z = zr * float3(sin(theta) * cos(phi), sin(phi) * sin(theta), cos(theta));
		z += p.xyz;
	}

	return 0.5 * log(r) * r / dr;
}

float GetMengerSpongeDistance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		MengerFold(p);
		RotateY(p, parameters.z * 0.1);
		RotateZ(p, parameters.z * 0.1);
		Scale(p, 3);
		Translate(p, float3(-parameters.x - 2, -parameters.y - 2, 0));
		PlaneFold(p, float3(0, 0, -1), -1);
	}

	return GetBoxDistance(p, 2);
}

float GetSierpinskiTetrahedronDistance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1);
		SierpinskiFold(p);
		RotateY(p, parameters.y * 0.1);
		Scale(p, 2);
		RotateZ(p, parameters.y * 0.1);
		Translate(p, parameters.z - 1);
	}

	return GetTetrahedronDistance(p, 2);
}

// ****************** data

float4 GetMandelbulbData(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	float3 z = p.xyz;

	float dr = 1.0;
	float r = 0.0;

	for (int i = 0; i < MANDELBULB_ITERATIONS; i++) {
		r = length(z);

		if (r > 2) break;

		// convert to polar coordinates
		float theta = acos(z.z / r);
		float phi = atan2(z.y, z.x);

		dr = pow(r, parameters.x - 1.0) * parameters.x * dr + 1.0;

		// scale and rotate the point
		float zr = pow(r, parameters.x);
		theta = theta * parameters.x;
		phi = phi * parameters.x;

		// convert back to cartesian coordinates
		z = zr * float3(sin(theta) * cos(phi), sin(phi) * sin(theta), cos(theta));
		z += p.xyz;

		ApplyOrbitTrap(function, orbit, z, color);
	}

	return float4(orbit, 0.5 * log(r) * r / dr);
}

float4 GetMengerSpongeData(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		MengerFold(p);
		RotateY(p, parameters.z * 0.1);
		RotateZ(p, parameters.z * 0.1);
		Scale(p, 3);
		Translate(p, float3(-parameters.x - 2, -parameters.y - 2, 0));
		PlaneFold(p, float3(0, 0, -1), -1);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetSierpinskiTetrahedronData(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1);
		SierpinskiFold(p);
		RotateY(p, parameters.y * 0.1);
		Scale(p, 2);
		RotateZ(p, parameters.y * 0.1);
		Translate(p, parameters.z - 1);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetTetrahedronDistance(p, 2));
}

#endif