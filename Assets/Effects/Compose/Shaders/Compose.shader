﻿Shader "Custom/Compose" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_Addition("Base (RGB)", 2D) = "white" {}
		_Color("Boom Color", Color) = (1, 1, 1, 1)
	}
	SubShader{
		Pass{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			sampler2D _Addition;
			uniform float4 _Color;
			fixed4 frag(v2f_img i) : COLOR
			{
				return tex2D(_MainTex, i.uv) + tex2D(_Addition, i.uv) * _Color;
			}
		ENDCG
		}
	}
}