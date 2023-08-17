using UnityEngine;

namespace RayMarcher {
	public class Fractal : MonoBehaviour {
		public enum Type {
			// common

			Mandelbulb,
			MengerSponge,
			SierpinskiTetrahedron,

			// custom

			Sprout,
			Lychee,
			RockCandy,
			SpongeTaffy,
			BrusselSprout,
			Rhubarb,
			Jawbreaker,
			SwissCheese,
			Kale,
			Shiitake
		}

		[Header("Geometry")]
		public Type type = Type.Mandelbulb;
		public Vector3 parameters = Vector3.zero;

		[Header("Material")]
		public FractalMaterial material = null;
	}
}