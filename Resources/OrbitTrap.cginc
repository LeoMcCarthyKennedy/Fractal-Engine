#ifndef ORBIT_TRAP
#define ORBIT_TRAP

float3 GetOrbitInitialValue(float3 color, int initialValue) {
	float3 value = 0;

	switch (initialValue) {
		case 0:
			value = color;
			break;
		case 1:
			value = -1e20;
			break;
		case 2:
			break;
		case 3:
			value = 1e20;
			break;
	}

	return value;
}

void ApplyOrbitTrap(int function, inout float3 orbit, float3 p, float3 color) {
	switch (function) {
		case 0:
			break;
		case 1:
			orbit = min(orbit, p * color);
			break;
		case 2:
			orbit = min(orbit, abs(p) * color);
			break;
		case 3:
			orbit = max(orbit, p * color);
			break;
		case 4:
			orbit = max(orbit, abs(p) * color);
			break;
		case 5:
			orbit += p * color;
			break;
		case 6:
			orbit += abs(p) * color;
			break;
	}
}

#endif