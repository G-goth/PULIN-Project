using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System.Linq;

[RequireComponent(typeof(Text))]
public class VerticalText : UIBehaviour, IMeshModifier
{
	private Text textComponet;
	private char[] characters;
	[SerializeField]
	private List<char> nonrotatableCharacters;

	public new void OnValidate()
	{
		base.OnValidate();
		textComponet = this.GetComponent<Text>();

		var graphics = base.GetComponent<Graphic>();
		if(graphics != null)
		{
			graphics.SetVerticesDirty();
		}
	}

	public void ModifyMesh(Mesh mesh)
	{
	}

	public void ModifyMesh(VertexHelper verts)
	{
		if(!this.IsActive())
		{
			return;
		}

		List<UIVertex> vertexList = new List<UIVertex>();
		verts.GetUIVertexStream(vertexList);

		ModifyVertices(vertexList);

		verts.Clear();
		verts.AddUIVertexTriangleStream(vertexList);
	}

	private void ModifyVertices(List<UIVertex> vertexList)
	{
		characters = textComponet.text.ToCharArray();
		if(characters.Length == 0)
		{
			return;
		}

		for(int i = 0, vertexListCount = vertexList.Count; i < vertexList.Count; i += 6)
		{
			int index = i / 6;
			if(IsNonrotatableCharacter(characters[index]))
			{
				continue;
			}

			var center = Vector2.Lerp(vertexList[i].position, vertexList[i + 3].position, 0.5f);
			for(int r = 0; r < 6; ++r)
			{
				var elemet = vertexList[i + r];
				var pos = elemet.position - (Vector3)center;
				var newPos = new Vector2(
					pos.x * Mathf.Cos(90 * Mathf.Deg2Rad) - pos.y * Mathf.Sin(90 * Mathf.Deg2Rad),
					pos.x * Mathf.Sin(90 * Mathf.Deg2Rad) + pos.y * Mathf.Cos(90 * Mathf.Deg2Rad)
				);

				elemet.position = (Vector3)(newPos + center);
				vertexList[i + r] = elemet;
			}
		}
	}

	private bool IsNonrotatableCharacter(char character)
	{
		return nonrotatableCharacters.Any(x => x == character);
	}
}
