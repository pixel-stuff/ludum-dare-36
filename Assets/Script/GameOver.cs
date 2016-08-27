﻿using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class GameOver : MonoBehaviour {

	// Use this for initialization
	public void StartGameOverAnimation () {
		StartCoroutine (FadeOutAnim ());
	}

	#region Coroutine
	public IEnumerator FadeOutAnim(){
		float alpha = 0;
		Color col = this.GetComponent<Image>().color;
		do{
			alpha += 0.015f;
			col.a = alpha;
			this.GetComponent<Image>().color = col;
			yield return new WaitForEndOfFrame();
		}while(alpha <= 1.0f);
	}
	#endregion Coroutine
}
