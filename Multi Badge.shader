// Copyright (c) 2018 @Feyris77
// 2022-10-26, v1.1 - added maximum picture size for @waya0125
// Released under the MIT license
// https://opensource.org/licenses/mit-license.php
// https://booth.pm/ja/items/1174066
Shader "Custom/Multi Badge" {
	Properties {
		[Header(Textures)]
		[NoScaleOffset]_MainTex ("Main Texture (4x4 Grid)", 2D) = "white" {}
		[NoScaleOffset]_EmiTex  ("Emission Texture (4x4 Grid)", 2D) = "black" {}  
		[NoScaleOffset]_TranTex ("Transition Texture (4x4 Grid or Single)", 2D) = "white" {}

		[Header(Visual Setting)]
		_Main_Color     ("Main Color",     Color) = (1,1,1,1)
		[HDR]_Emi_Color ("Emission Color", Color) = (0,0,0,1)
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic   ("Metallic", Range(0,1)) = 1.0

		[Header(Transition Setting)]
		[IntRange]_Max_img ("Max images", Range(4, 32)) = 32 //Defaultは2,16=16、最大枚数に応じて変更
		[KeywordEnum(Multi, Single)] _Transition_Mode ("Transition Texture Mode", Float) = 1
		_Transition_Speed ("Transition Speed", Range(.1,1)) = 0.1
		_Change_Speed ("Change Speed", Range(0,1)) = .5
	} SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0
		#pragma shader_feature _ _TRANSITION_MODE_MULTI _TRANSITION_MODE_SINGLE

		sampler2D _MainTex, _EmiTex, _TranTex;

		struct Input {
			float2 uv_MainTex;
		};

		uniform float _Glossiness, _Metallic, _Transition_Speed, _Change_Speed;
		uniform float4 _Main_Color, _Emi_Color;
		uniform int _Max_img;

		UNITY_INSTANCING_BUFFER_START(Props)
		UNITY_INSTANCING_BUFFER_END(Props)

		// float2 uvとfloat2 UV1、float2 UV2の"8"を変更すると、最大画像枚数を変更できます。
		void surf (Input IN, inout SurfaceOutputStandard o) {
			float2 uv = IN.uv_MainTex/8;
			float time = _Time.y*_Change_Speed;

			float index = floor(fmod(time, _Max_img));// 0～_Max_img loop
			float2 UV1 = uv+float2(fmod(index, 8), floor(index/8))/8; // 現在の画像
			index += index+1 < _Max_img ? 1 : -index;
			float2 UV2 = uv+float2(fmod(index, 8), floor(index/8))/8; // 次の画像

			float2 FadeUV = float2(0,0);
			#ifdef _TRANSITION_MODE_MULTI
				FadeUV = UV1;
			#elif _TRANSITION_MODE_SINGLE
				FadeUV = IN.uv_MainTex;
			#endif

			float4 c1  = tex2D (_MainTex, UV1) * _Main_Color;
			float4 c2  = tex2D (_MainTex, UV2) * _Main_Color;
			float4 e1  = tex2D (_EmiTex,  UV1) * _Emi_Color;
			float4 e2  = tex2D (_EmiTex,  UV2) * _Emi_Color;
			float Fade = tex2D (_TranTex, FadeUV).r+.001;
			Fade *= pow(fmod(time, 1), 1/_Transition_Speed) * _Change_Speed;

			float4 Mcol = Fade < .0001 ? c1 :  c2 ;
			float4 Ecol = Fade < .0001 ? e1 :  e2 ;

			o.Albedo     = Mcol.rgb;
			o.Emission   = Ecol;
			o.Metallic   = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha      = Mcol.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
