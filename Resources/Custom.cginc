#include "Settings.cginc"
#include "OrbitTrap.cginc"
#include "Primitives.cginc"
#include "Transformations.cginc"

#ifndef CUSTOM
#define CUSTOM

// ****************** distances

float GetCustom1Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 0.15);
		AbsFold(p);
		Scale(p, 1.5);
		Translate(p, float3(-1, -0.5, -0.2));
		RotateY(p, parameters.y * 0.1 + 0.45);
		RotateZ(p, parameters.z * 0.1 + 0.45);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom2Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateX(p, parameters.x * 0.1 + 1.18);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, -1.2, 0.1));
		RotateY(p, parameters.y * 0.1 + 8.123);
		MengerFold(p);
		RotateY(p, parameters.z * 0.1 + 6.72);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom3Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateX(p, parameters.x * 0.1 + 4.221);
		RotateZ(p, parameters.y * 0.1 + 2.925);
		Scale(p, 1.3);
		Translate(p, float3(1.2, 0, 1.2));
		RotateY(p, parameters.z * 0.1 + 2.34);
		MengerFold(p);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom4Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 5.25);
		MengerFold(p);
		RotateY(p, parameters.y * 0.1 + 4.25);
		Scale(p, 1.5);
		RotateZ(p, parameters.z * 0.1 + 1.75);
		Translate(p, float3(-1, -2, 0));
		AbsFold(p);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom5Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateZ(p, parameters.x * 0.1 + 0.41);
		MengerFold(p);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, 0, 0));
		RotateY(p, parameters.y * 0.1 - 3.02);
		RotateX(p, parameters.z * 0.1 + 8.816);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom6Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		Scale(p, 1.5);
		RotateX(p, parameters.x * 0.1 - 0.06);
		Translate(p, float3(-1, -0.4, -0.1));
		RotateY(p, parameters.y * 0.1 + 4.263);
		RotateZ(p, parameters.z * 0.1 + 2.89);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom7Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateZ(p, parameters.x * 0.1 + 0.472);
		SierpinskiFold(p);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, 0, 0));
		RotateY(p, parameters.y * 0.1 + 0.57);
		RotateX(p, parameters.z * 0.1 + 13.89);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom8Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		BoxFold(p, 0.5);
		RotateX(p, parameters.x * 0.1 + (PI / 2) + 26.675);
		MengerFold(p);
		Scale(p, 2);
		RotateY(p, parameters.y * 0.1 + (PI / 2) + 4.63);
		Translate(p, float3(-1, -0.5, 0.25));
		RotateZ(p, parameters.z * 0.1 + (PI / 2) + 9.912);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom9Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateY(p, parameters.x * 0.1 + 0.65);
		AbsFold(p);
		MengerFold(p);
		RotateX(p, parameters.y * 0.1);
		Scale(p, 1.5);
		Translate(p, float3(-1.8, -3.8, 0));
		RotateZ(p, parameters.z * 0.1);
		PlaneFold(p, float3(0, 0, -1), 0);
	}

	return GetBoxDistance(p, 2);
}

float GetCustom10Distance(float4 p, float3 parameters) {
	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 5.691);
		RotateY(p, parameters.y * 0.1 - 1.913);
		SierpinskiFold(p);
		Scale(p, 1.3);
		Translate(p, float3(-1.1, 0.1, 0));
		RotateZ(p, parameters.z * 0.1 + 0.101);
	}

	return GetBoxDistance(p, 2);
}

// ****************** data

float4 GetCustom1Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 0.15);
		AbsFold(p);
		Scale(p, 1.5);
		Translate(p, float3(-1, -0.5, -0.2));
		RotateY(p, parameters.y * 0.1 + 0.45);
		RotateZ(p, parameters.z * 0.1 + 0.45);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom2Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateX(p, parameters.x * 0.1 + 1.18);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, -1.2, 0.1));
		RotateY(p, parameters.y * 0.1 + 8.123);
		MengerFold(p);
		RotateY(p, parameters.z * 0.1 + 6.72);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom3Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateX(p, parameters.x * 0.1 + 4.221);
		RotateZ(p, parameters.y * 0.1 + 2.925);
		Scale(p, 1.3);
		Translate(p, float3(1.2, 0, 1.2));
		RotateY(p, parameters.z * 0.1 + 2.34);
		MengerFold(p);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom4Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 5.25);
		MengerFold(p);
		RotateY(p, parameters.y * 0.1 + 4.25);
		Scale(p, 1.5);
		RotateZ(p, parameters.z * 0.1 + 1.75);
		Translate(p, float3(-1, -2, 0));
		AbsFold(p);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom5Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateZ(p, parameters.x * 0.1 + 0.41);
		MengerFold(p);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, 0, 0));
		RotateY(p, parameters.y * 0.1 - 3.02);
		RotateX(p, parameters.z * 0.1 + 8.816);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom6Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		Scale(p, 1.5);
		RotateX(p, parameters.x * 0.1 - 0.06);
		Translate(p, float3(-1, -0.4, -0.1));
		RotateY(p, parameters.y * 0.1 + 4.263);
		RotateZ(p, parameters.z * 0.1 + 2.89);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom7Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		AbsFold(p);
		RotateZ(p, parameters.x * 0.1 + 0.472);
		SierpinskiFold(p);
		Scale(p, 1.4);
		Translate(p, float3(-0.4, 0, 0));
		RotateY(p, parameters.y * 0.1 + 0.57);
		RotateX(p, parameters.z * 0.1 + 13.89);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom8Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		BoxFold(p, 0.5);
		RotateX(p, parameters.x * 0.1 + (PI / 2) + 26.675);
		MengerFold(p);
		Scale(p, 2);
		RotateY(p, parameters.y * 0.1 + (PI / 2) + 4.63);
		Translate(p, float3(-1, -0.5, 0.25));
		RotateZ(p, parameters.z * 0.1 + (PI / 2) + 9.912);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom9Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateY(p, parameters.x * 0.1 + 0.65);
		AbsFold(p);
		MengerFold(p);
		RotateX(p, parameters.y * 0.1);
		Scale(p, 1.5);
		Translate(p, float3(-1.8, -3.8, 0));
		RotateZ(p, parameters.z * 0.1);
		PlaneFold(p, float3(0, 0, -1), 0);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

float4 GetCustom10Data(float4 p, float3 parameters, float3 color, int initialValue, int function) {
	float3 orbit = GetOrbitInitialValue(color, initialValue);

	for (int i = 0; i < FRACTAL_ITERATIONS; i++) {
		RotateX(p, parameters.x * 0.1 + 5.691);
		RotateY(p, parameters.y * 0.1 - 1.913);
		SierpinskiFold(p);
		Scale(p, 1.3);
		Translate(p, float3(-1.1, 0.1, 0));
		RotateZ(p, parameters.z * 0.1 + 0.101);

		ApplyOrbitTrap(function, orbit, p.xyz, color);
	}

	return float4(orbit, GetBoxDistance(p, 2));
}

#endif