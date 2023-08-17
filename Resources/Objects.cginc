#include "Custom.cginc"
#include "Fractals.cginc"
#include "Settings.cginc"
#include "OrbitTrap.cginc"
#include "Primitives.cginc"
#include "Transformations.cginc"

#ifndef OBJECTS
#define OBJECTS

// prevents scales of zero
#define MIN_SCALE 0.1

// ****************** primitive distances

float GetPrimitiveDistance(float4 p, Primitive primitive) {
	float distance = MAX_DISTANCE;

	Translate(p, -primitive.position);

	Rotate(p, primitive.rotation);

	primitive.scale.x = 1 / max(primitive.scale.x, MIN_SCALE);
	primitive.scale.y = 1 / max(primitive.scale.y, MIN_SCALE);
	primitive.scale.z = 1 / max(primitive.scale.z, MIN_SCALE);

	Scale(p, primitive.scale);

	switch (primitive.type) {
		case 0:
			distance = GetSphereDistance(p, abs(primitive.parameters.x));
			break;
		case 1:
			distance = GetBoxDistance(p, abs(primitive.parameters));
			break;
		case 2:
			distance = GetTorusDistance(p, abs(primitive.parameters.xy));
			break;
		case 3:
			distance = GetCylinderDistance(p, abs(primitive.parameters.xy));
			break;
		case 4:
			distance = GetTetrahedronDistance(p, abs(primitive.parameters.x));
			break;
	}

	return distance;
}

// ****************** fractal distances

float GetFractalDistance(float4 p, float3 position, float3 rotation, float3 scale, int type, float3 parameters) {
	float distance = MAX_DISTANCE;

	Translate(p, -position);

	Rotate(p, rotation);

	scale.x = 1 / max(scale.x, MIN_SCALE);
	scale.y = 1 / max(scale.y, MIN_SCALE);
	scale.z = 1 / max(scale.z, MIN_SCALE);

	Scale(p, scale);

	switch (type) {
		case -1:
			break;

			// common

		case 0:
			distance = GetMandelbulbDistance(p, parameters);
			break;
		case 1:
			distance = GetMengerSpongeDistance(p, parameters);
			break;
		case 2:
			distance = GetSierpinskiTetrahedronDistance(p, parameters);
			break;

			// custom

		case 3:
			distance = GetCustom1Distance(p, parameters);
			break;
		case 4:
			distance = GetCustom2Distance(p, parameters);
			break;
		case 5:
			distance = GetCustom3Distance(p, parameters);
			break;
		case 6:
			distance = GetCustom4Distance(p, parameters);
			break;
		case 7:
			distance = GetCustom5Distance(p, parameters);
			break;
		case 8:
			distance = GetCustom6Distance(p, parameters);
			break;
		case 9:
			distance = GetCustom7Distance(p, parameters);
			break;
		case 10:
			distance = GetCustom8Distance(p, parameters);
			break;
		case 11:
			distance = GetCustom9Distance(p, parameters);
			break;
		case 12:
			distance = GetCustom10Distance(p, parameters);
			break;
	}

	return distance;
}

// ****************** fractal data

float4 GetFractalData(float4 p, float3 position, float3 rotation, float3 scale, int type, float3 parameters, float3 color, int initialValue, int function) {
	float4 data = float4(0, 0, 0, MAX_DISTANCE);

	Translate(p, -position);

	Rotate(p, rotation);

	scale.x = 1 / max(scale.x, MIN_SCALE);
	scale.y = 1 / max(scale.y, MIN_SCALE);
	scale.z = 1 / max(scale.z, MIN_SCALE);

	Scale(p, scale);

	switch (type) {
		case -1:
			break;

			// common

		case 0:
			data = GetMandelbulbData(p, parameters, color, initialValue, function);
			break;
		case 1:
			data = GetMengerSpongeData(p, parameters, color, initialValue, function);
			break;
		case 2:
			data = GetSierpinskiTetrahedronData(p, parameters, color, initialValue, function);
			break;

			// custom

		case 3:
			data = GetCustom1Data(p, parameters, color, initialValue, function);
			break;
		case 4:
			data = GetCustom2Data(p, parameters, color, initialValue, function);
			break;
		case 5:
			data = GetCustom3Data(p, parameters, color, initialValue, function);
			break;
		case 6:
			data = GetCustom4Data(p, parameters, color, initialValue, function);
			break;
		case 7:
			data = GetCustom5Data(p, parameters, color, initialValue, function);
			break;
		case 8:
			data = GetCustom6Data(p, parameters, color, initialValue, function);
			break;
		case 9:
			data = GetCustom7Data(p, parameters, color, initialValue, function);
			break;
		case 10:
			data = GetCustom8Data(p, parameters, color, initialValue, function);
			break;
		case 11:
			data = GetCustom9Data(p, parameters, color, initialValue, function);
			break;
		case 12:
			data = GetCustom10Data(p, parameters, color, initialValue, function);
			break;
	}

	return data;
}

#endif