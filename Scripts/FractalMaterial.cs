using UnityEngine;

namespace RayMarcher {
	[CreateAssetMenu(fileName = "New Fractal Material", menuName = "Ray Marcher/Fractal Material", order = 0)]
	public class FractalMaterial : Material {
		public enum Value {
			Color,
			NegativeInfinity,
			Zero,
			Infinity
		}

		public enum Function {
			None,
			Min,
			AbsMin,
			Max,
			AbsMax,
			Sum,
			AbsSum
		}

		public const float DEFAULT_FACTOR = 1.0f;

		public const Value DEFAULT_INITIAL_VALUE = Value.Color;
		public const Function DEFAULT_FUNCTION = Function.None;

		[Header("Color")]
		public Vector3 color = (Vector4)DEFAULT_COLOR;
		[Range(0.0f, 1.0f)]
		public float factor = DEFAULT_FACTOR;

		[Header("Orbit Trap")]
		public Value initialValue = DEFAULT_INITIAL_VALUE;
		public Function function = DEFAULT_FUNCTION;
	}
}