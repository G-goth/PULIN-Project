// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:True,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3970588,fgcg:0.116782,fgcb:0.116782,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33305,y:32171,varname:node_4013,prsc:2|diff-5711-OUT;n:type:ShaderForge.SFN_Tex2d,id:5431,x:32048,y:32452,ptovrint:False,ptlb:baseColor,ptin:_baseColor,varname:node_5431,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:3407,x:31836,y:32596,varname:node_3407,prsc:2;n:type:ShaderForge.SFN_Slider,id:8951,x:32120,y:32131,ptovrint:False,ptlb:Hue,ptin:_Hue,varname:node_8951,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_HsvToRgb,id:9641,x:32425,y:32178,varname:node_9641,prsc:2|H-8951-OUT,S-2748-OUT,V-5848-OUT;n:type:ShaderForge.SFN_Slider,id:2748,x:32070,y:32219,ptovrint:False,ptlb:Power,ptin:_Power,varname:_Hue_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:5848,x:32070,y:32312,ptovrint:False,ptlb:Lightness,ptin:_Lightness,varname:_Hue_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:1303,x:32397,y:32419,varname:node_1303,prsc:2|A-9641-OUT,B-5431-RGB;n:type:ShaderForge.SFN_Slider,id:7753,x:31836,y:32859,ptovrint:False,ptlb:Effect,ptin:_Effect,varname:node_7753,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:3475,x:32098,y:32699,varname:node_3475,prsc:2|A-3407-RGB,B-4639-OUT,T-7753-OUT;n:type:ShaderForge.SFN_Multiply,id:5711,x:32766,y:32427,varname:node_5711,prsc:2|A-8260-OUT,B-3475-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4639,x:31836,y:32766,ptovrint:False,ptlb:EmptyValue1,ptin:_EmptyValue1,varname:node_4639,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:3837,x:32587,y:32062,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_3837,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RgbToHsv,id:5497,x:32723,y:32159,varname:node_5497,prsc:2|IN-1303-OUT;n:type:ShaderForge.SFN_Lerp,id:8260,x:33007,y:32244,varname:node_8260,prsc:2|A-5497-VOUT,B-1303-OUT,T-3837-OUT;proporder:5431-8951-2748-3837-5848-7753-4639;pass:END;sub:END;*/

Shader "Creativemood/VertexColor" {
    Properties {
        _baseColor ("baseColor", 2D) = "white" {}
        _Hue ("Hue", Range(0, 1)) = 0.5
        _Power ("Power", Range(0, 1)) = 0
        _Saturation ("Saturation", Range(0, 1)) = 1
        _Lightness ("Lightness", Range(0, 2)) = 1
        _Effect ("Effect", Range(0, 1)) = 0.5
        [HideInInspector]_EmptyValue1 ("EmptyValue1", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _baseColor; uniform float4 _baseColor_ST;
            uniform float _Hue;
            uniform float _Power;
            uniform float _Lightness;
            uniform float _Effect;
            uniform float _EmptyValue1;
            uniform float _Saturation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _baseColor_var = tex2D(_baseColor,TRANSFORM_TEX(i.uv0, _baseColor));
                float3 node_1303 = ((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(_Hue+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Power)*_Lightness)*_baseColor_var.rgb);
                float4 node_5497_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_5497_p = lerp(float4(float4(node_1303,0.0).zy, node_5497_k.wz), float4(float4(node_1303,0.0).yz, node_5497_k.xy), step(float4(node_1303,0.0).z, float4(node_1303,0.0).y));
                float4 node_5497_q = lerp(float4(node_5497_p.xyw, float4(node_1303,0.0).x), float4(float4(node_1303,0.0).x, node_5497_p.yzx), step(node_5497_p.x, float4(node_1303,0.0).x));
                float node_5497_d = node_5497_q.x - min(node_5497_q.w, node_5497_q.y);
                float node_5497_e = 1.0e-10;
                float3 node_5497 = float3(abs(node_5497_q.z + (node_5497_q.w - node_5497_q.y) / (6.0 * node_5497_d + node_5497_e)), node_5497_d / (node_5497_q.x + node_5497_e), node_5497_q.x);;
                float3 diffuseColor = (lerp(float3(node_5497.b,node_5497.b,node_5497.b),node_1303,_Saturation)*lerp(i.vertexColor.rgb,float3(_EmptyValue1,_EmptyValue1,_EmptyValue1),_Effect));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            //#define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers gles3 metal xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _baseColor; uniform float4 _baseColor_ST;
            uniform float _Hue;
            uniform float _Power;
            uniform float _Lightness;
            uniform float _Effect;
            uniform float _EmptyValue1;
            uniform float _Saturation;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                //float attenuation = LIGHT_ATTENUATION(i);
                UNITY_LIGHT_ATTENUATION(attenuation, i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _baseColor_var = tex2D(_baseColor,TRANSFORM_TEX(i.uv0, _baseColor));
                float3 node_1303 = ((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(_Hue+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Power)*_Lightness)*_baseColor_var.rgb);
                float4 node_5497_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_5497_p = lerp(float4(float4(node_1303,0.0).zy, node_5497_k.wz), float4(float4(node_1303,0.0).yz, node_5497_k.xy), step(float4(node_1303,0.0).z, float4(node_1303,0.0).y));
                float4 node_5497_q = lerp(float4(node_5497_p.xyw, float4(node_1303,0.0).x), float4(float4(node_1303,0.0).x, node_5497_p.yzx), step(node_5497_p.x, float4(node_1303,0.0).x));
                float node_5497_d = node_5497_q.x - min(node_5497_q.w, node_5497_q.y);
                float node_5497_e = 1.0e-10;
                float3 node_5497 = float3(abs(node_5497_q.z + (node_5497_q.w - node_5497_q.y) / (6.0 * node_5497_d + node_5497_e)), node_5497_d / (node_5497_q.x + node_5497_e), node_5497_q.x);;
                float3 diffuseColor = (lerp(float3(node_5497.b,node_5497.b,node_5497.b),node_1303,_Saturation)*lerp(i.vertexColor.rgb,float3(_EmptyValue1,_EmptyValue1,_EmptyValue1),_Effect));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
