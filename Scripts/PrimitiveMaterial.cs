using UnityEngine;

namespace RayMarcher {
	[CreateAssetMenu(fileName = "New Primitive Material", menuName = "Ray Marcher/Primitive Material", order = 1)]
	public class PrimitiveMaterial : Material {
		[Header("Color")]
		public Color color = DEFAULT_COLOR;
	}
}