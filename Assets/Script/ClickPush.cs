using UnityEngine;
using UnityEngine.EventSystems;

public class ClickPush : MonoBehaviour
{
	[SerializeField]
	private float pushPowX = 0.0f;
	[SerializeField]
	private float pushPowY = 0.0f;
	[SerializeField]
	private float pushPowZ = 0.0f;
	[SerializeField]
	private float distance = 0.0f;
	[SerializeField]
	private GameObject targetObj;

	// Use this for initialization
	void Start()
	{
	}
	
	// Update is called once per frame
	void Update()
	{
		Vector2 touchScreenPosition = Input.mousePosition;
		Camera mainCamera = Camera.main;
		Ray touchPointToRay = mainCamera.ScreenPointToRay(touchScreenPosition);

    	RaycastHit hitInfo = new RaycastHit();
		if(Physics.Raycast(touchPointToRay, out hitInfo, distance))
		{
			if(Input.GetMouseButtonDown(0) & hitInfo.transform.tag == "DynamicBone")
			{
				hitInfo.rigidbody.AddForce(pushPowX, pushPowY, pushPowZ, ForceMode.Impulse);
			}
			if(Input.GetMouseButtonDown(0) & hitInfo.transform.tag == "AmplifyEffect")
			{
				ExecuteEvents.Execute<IAmplifyEffect>(
					target: targetObj,
					eventData: null,
					functor: (reciever, eventData) => reciever.AEOnRecieved()
				);
			}
		}
	}
}