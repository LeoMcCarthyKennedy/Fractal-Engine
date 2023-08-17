using System.Collections.Generic;

using UnityEngine;

namespace RayMarcher {
	[ImageEffectAllowedInSceneView, ExecuteInEditMode]
	public class RayMarcherCamera : MonoBehaviour {
		[Header("World")]
		public Cubemap skybox = null;

		[Space(10)]
		public Color skyColor = Color.black;
		[Range(0.0f, 10.0f)]
		public float fogStrength = 0.0f;

		[Space(10)]
		public Color glowColor = Color.black;
		[Range(0.0f, 1.0f)]
		public float glowStrength = 0.0f;

		private ComputeShader rayMarcher = null;
		private new Camera camera = null;
		private RenderTexture renderTexture = null;
		private ComputeBuffer primitiveBuffer = null;

		private void OnRenderImage(RenderTexture source, RenderTexture destination) {
			if (!rayMarcher) {
				// fetch the compute shader from files
				rayMarcher = (ComputeShader)Resources.Load("RayMarcher");
			}

			if (!camera) {
				camera = GetComponent<Camera>();
			}

			SetUpRayMarcher();

			int threadGroupsX = Mathf.CeilToInt(renderTexture.width / 16.0f);
			int threadGroupsY = Mathf.CeilToInt(renderTexture.height / 16.0f);

			rayMarcher.Dispatch(0, threadGroupsX, threadGroupsY, 1);
			primitiveBuffer.Dispose();

			// render frame
			Graphics.Blit(renderTexture, destination);
		}

		private void SetUpRayMarcher() {
			SetUpRenderTexture();

			rayMarcher.SetTexture(0, "renderTexture", renderTexture);

			rayMarcher.SetMatrix("cameraToWorldMatrix", camera.cameraToWorldMatrix);
			rayMarcher.SetMatrix("cameraProjectionMatrixInverse", camera.projectionMatrix.inverse);

			if (skybox) {
				rayMarcher.SetBool("hasSkybox", true);

				// send skybox cubemap
				rayMarcher.SetTexture(0, "skybox", skybox);
			} else {
				rayMarcher.SetBool("hasSkybox", false);

				// send empty cubemap
				rayMarcher.SetTexture(0, "skybox", new Cubemap(1, TextureFormat.RGBAFloat, false));
			}

			rayMarcher.SetVector("skyColor", skyColor);
			rayMarcher.SetFloat("fogStrength", fogStrength);

			rayMarcher.SetVector("glowColor", glowColor);
			rayMarcher.SetFloat("glowStrength", glowStrength);

			RayMarcherLight light = FindObjectOfType<RayMarcherLight>();

			if (light) {
				rayMarcher.SetVector("lightDirection", -light.transform.up);
				rayMarcher.SetVector("lightColor", light.color);
			} else {
				rayMarcher.SetVector("lightDirection", RayMarcherLight.DEFAULT_DIRECTION);
				rayMarcher.SetVector("lightColor", RayMarcherLight.DEFAULT_COLOR);
			}

			Fractal fractal = FindObjectOfType<Fractal>();

			if (fractal) {
				rayMarcher.SetVector("fractalPosition", fractal.transform.position);
				rayMarcher.SetVector("fractalRotation", fractal.transform.eulerAngles * Mathf.Deg2Rad);
				rayMarcher.SetVector("fractalScale", fractal.transform.localScale);

				rayMarcher.SetInt("fractalType", (int)fractal.type);
				rayMarcher.SetVector("fractalParameters", fractal.parameters);

				if (fractal.material) {
					rayMarcher.SetFloat("fractalShine", Mathf.Max(fractal.material.shine, fractal.material.reflectiveness));
					rayMarcher.SetFloat("fractalReflectiveness", fractal.material.reflectiveness);

					rayMarcher.SetVector("orbitColor", fractal.material.color * fractal.material.factor);
					rayMarcher.SetInt("orbitInitialValue", (int)fractal.material.initialValue);
					rayMarcher.SetInt("orbitTrapFunction", (int)fractal.material.function);
				} else {
					rayMarcher.SetFloat("fractalShine", Mathf.Max(Material.DEFAULT_SHINE, Material.DEFAULT_REFLECTIVENESS));
					rayMarcher.SetFloat("fractalReflectiveness", Material.DEFAULT_REFLECTIVENESS);

					rayMarcher.SetVector("orbitColor", Material.DEFAULT_COLOR * FractalMaterial.DEFAULT_FACTOR);
					rayMarcher.SetInt("orbitInitialValue", (int)FractalMaterial.DEFAULT_INITIAL_VALUE);
					rayMarcher.SetInt("orbitTrapFunction", (int)FractalMaterial.DEFAULT_FUNCTION);
				}
			} else {
				// no fractal in scene
				rayMarcher.SetInt("fractalType", -1);
			}

			SetUpPrimitiveBuffer();

			if (primitiveBuffer != null) {
				rayMarcher.SetBuffer(0, "primitives", primitiveBuffer);
				rayMarcher.SetInt("primitiveCount", primitiveBuffer.count);
			} else {
				// send empty buffer

				primitiveBuffer = new ComputeBuffer(1, PrimitiveData.STRIDE);

				rayMarcher.SetBuffer(0, "primitives", primitiveBuffer);
				rayMarcher.SetInt("primitiveCount", 0);
			}
		}

		private void SetUpRenderTexture() {
			if (!renderTexture || renderTexture.width != camera.pixelWidth || renderTexture.height != camera.pixelHeight) {
				if (renderTexture) {
					renderTexture.Release();
				}

				renderTexture = new RenderTexture(camera.pixelWidth, camera.pixelHeight, 0, RenderTextureFormat.ARGBFloat, RenderTextureReadWrite.Linear) { enableRandomWrite = true };
				renderTexture.Create();
			}
		}

		private void SetUpPrimitiveBuffer() {
			primitiveBuffer = null;

			// gather the scene objects
			List<Primitive> primitives = new List<Primitive>(FindObjectsOfType<Primitive>());

			if (primitives.Count == 0) {
				return;
			}

			PrimitiveData[] primitiveData = new PrimitiveData[primitives.Count];

			// create the data for the buffer
			for (int i = 0; i < primitiveData.Length; i++) {
				primitiveData[i] = new PrimitiveData(primitives[i]);
			}

			primitiveBuffer = new ComputeBuffer(primitiveData.Length, PrimitiveData.STRIDE);
			primitiveBuffer.SetData(primitiveData);
		}
	}
}