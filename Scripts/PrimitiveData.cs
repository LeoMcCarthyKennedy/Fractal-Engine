using UnityEngine;

namespace RayMarcher {
	public struct PrimitiveData {
		// the size of the struct in bytes
		public const int STRIDE = sizeof(float) * 17 + sizeof(int) * 1;

		public Vector3 position;
		public Vector3 rotation;
		public Vector3 scale;

		public int type;
		public Vector3 parameters;

		public float shine;
		public float reflectiveness;

		public Vector3 color;

		public PrimitiveData(Primitive primitive) {
			position = primitive.transform.position;
			rotation = primitive.transform.eulerAngles * Mathf.Deg2Rad;
			scale = primitive.transform.localScale;

			type = (int)primitive.type;
			parameters = primitive.parameters;

			if (primitive.material) {
				shine = Mathf.Max(primitive.material.shine, primitive.material.reflectiveness);
				reflectiveness = primitive.material.reflectiveness;

				color = (Vector4)primitive.material.color;
			} else {
				shine = Mathf.Max(Material.DEFAULT_SHINE, Material.DEFAULT_REFLECTIVENESS);
				reflectiveness = Material.DEFAULT_REFLECTIVENESS;

				color = (Vector4)Material.DEFAULT_COLOR;
			}
		}
	}
}