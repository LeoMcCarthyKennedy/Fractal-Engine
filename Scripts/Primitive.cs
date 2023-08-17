using UnityEngine;

namespace RayMarcher {
	public class Primitive : MonoBehaviour {
		public enum Type {
			Sphere,
			Box,
			Torus,
			Cylinder,
			Tetrahedron
		};

		[Header("Geometry")]
		public Type type = Type.Sphere;
		public Vector3 parameters = Vector3.one;

		[Header("Material")]
		public PrimitiveMaterial material = null;
	}
}