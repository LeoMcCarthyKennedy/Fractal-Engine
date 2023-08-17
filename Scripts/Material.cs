using UnityEngine;

namespace RayMarcher {
	public abstract class Material : ScriptableObject {
		public const float DEFAULT_SHINE = 0.0f;
		public const float DEFAULT_REFLECTIVENESS = 0.0f;

		public static readonly Color DEFAULT_COLOR = Color.gray;

		[Header("Surface"), Range(0.0f, 1.0f)]
		public float shine = DEFAULT_SHINE;
		[Range(0.0f, 1.0f)]
		public float reflectiveness = DEFAULT_REFLECTIVENESS;
	}
}