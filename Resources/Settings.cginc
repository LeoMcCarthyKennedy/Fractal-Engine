#ifndef SETTINGS
#define SETTINGS

// ****************** performance

// number of anti-aliasing samples (0, 10)
#define AA_SAMPLES 1

// maximum number of recursive reflections (0, 10)
#define MAX_REFLECTIONS 1

// maximum number of ray marches (50, 5000)
#define MAX_STEPS 500

// minimum march distance (1e-1, 1e-8)
#define MIN_DISTANCE 1e-5
// maximum march distance (10, 1000)
#define MAX_DISTANCE 100

// number of recursive mandelbulb iterations (2, 20)
#define MANDELBULB_ITERATIONS 6
// number of recursive fractal iterations (4, 40)
#define FRACTAL_ITERATIONS 24

// shadows (0 off, 1 on)
#define SHADOWS 1

// ****************** lighting

// ambient light strength (0.0, 1.0)
#define AMBIENT 0.05
// specular highlight sharpness (8, 64)
#define SPECULAR_POWER 40

// ambient occlusion (0 off, 1 on)
#define AO 1
// ambient occlusion strength (0.0, 1.0)
#define AO_STRENGTH 0.9

// shadow ambient strength (0.0, 1.0)
#define SHADOW_AMBIENT 0.05
// shadow edge sharpness (0, 10)
#define SHADOW_SHARPNESS 5

// glow edge sharpness (0, 10)
#define GLOW_SHARPNESS 8

// ****************** other

// smooth distances (0, 10)
#define SMOOTH 0

// ****************** constants

#define SURFACE_BIAS 32

#define PI 3.14159265358979

#endif