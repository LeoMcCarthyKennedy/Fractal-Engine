using UnityEngine;

namespace RayMarcher {
	public class RayMarcherLight : MonoBehaviour {
		public static readonly Vector3 DEFAULT_DIRECTION = Vector3.down;
		public static readonly Color DEFAULT_COLOR = Color.white;

		[Header("Light")]
		public Color color = DEFAULT_COLOR;
	}
}