using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;

public interface IAmplifyEffect : IEventSystemHandler
{
	void AEOnRecieved();
}

public class AmplifyEffect : MonoBehaviour, IAmplifyEffect
{
	[SerializeField]
	private float amplifyLevel;
	[SerializeField]
	private float amplifyTime;
	[SerializeField]
	private float amplifyRateOverTime;
	private float timeCount;
	private ParticleSystem effectScale;
	private ParticleSystem particle;

	// Use this for initialization
	void Start()
	{
		timeCount = 0.0f;
		effectScale = GetComponentInChildren<ParticleSystem>();
		particle = GetComponentInChildren<ParticleSystem>();
	}
	
	// Update is called once per frame
	void Update() 
	{
	}

	private IEnumerator GraduallyAmplifyEffect()
	{
		var _emission = particle.emission;

		// パーティクルの1秒あたりの量の変更
		for(float f = 0.0f; f <= 100.0f; f += 5.0f)
		{
			_emission.rateOverTime = f;
			yield return new WaitForSeconds(0.01f);
		}
		
		yield return new WaitForSeconds(1.0f);

		_emission.rateOverTime = 5.0f;

		yield return null;
	}
	private IEnumerator EffectScaleChenge()
	{
		for(float f = 0.0f; f <= 0.3f; f += 0.05f)
		{
			effectScale.transform.localScale = new Vector3(f, f, f);
			yield return new WaitForSeconds(0.01f);
		}

		yield return new WaitForSeconds(1.0f);

		for(float f = 0.3f; f >= 0.1f; f -= 0.05f)
		{
			effectScale.transform.localScale = new Vector3(f, f, f);
			yield return new WaitForSeconds(0.01f);
		}
		yield return null;
	}

	public void AEOnRecieved()
	{
		StartCoroutine(GraduallyAmplifyEffect());
		StartCoroutine(EffectScaleChenge());
	}
}