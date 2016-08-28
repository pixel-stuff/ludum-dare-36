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
				#if SHADER_API_GLCORE || SHADER_API_OPENGL || SHADER_API_GLES || SHADER_API_GLES3
					float2 uvadd = float2(i.uv.x, 1.0 - i.uv.y);
				#else
					float2 uvadd = i.uv;
				#endif
				return tex2D(_MainTex, i.uv) + tex2D(_Addition, uvadd);
			}
		ENDCG
		}
	}
}