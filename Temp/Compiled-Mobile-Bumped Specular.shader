// Compiled shader for iOS

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Mobile/Bumped Specular" {
Properties {
[PowerSlider(5.0)]  _Shininess ("Shininess", Range(0.030000,1.000000)) = 0.078125
 _MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
[NoScaleOffset]  _BumpMap ("Normalmap", 2D) = "bump" { }
}
SubShader { 
 LOD 250
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    half4 u_xlat16_0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    int u_xlati12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    u_xlati12 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati12 = u_xlati12 * 0x7;
    u_xlat16_1.xyz = u_xlat16_1.xyz * UnityInstancing_PerDraw2[u_xlati12 / 7].unity_SHCArray.www;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    int u_xlati12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    u_xlati12 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati12 = u_xlati12 * 0x7;
    u_xlat16_1.xyz = u_xlat16_1.xyz * UnityInstancing_PerDraw2[u_xlati12 / 7].unity_SHCArray.www;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_BumpMap" to slot 1

Constant Buffer "FGlobals" (18 bytes) on slot 0 {
  VectorHalf4 _WorldSpaceLightPos0 at 0
  VectorHalf4 _LightColor0 at 8
  ScalarHalf _Shininess at 16
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    half4 _WorldSpaceLightPos0;
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_BumpMap [[ sampler (1) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    half3 u_xlat16_1;
    half3 u_xlat16_2;
    float3 u_xlat3;
    half3 u_xlat16_5;
    half u_xlat16_9;
    float u_xlat12;
    int u_xlati12;
    half u_xlat16_13;
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_1.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_13 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_13 = min(u_xlat16_13, half(1.0));
    u_xlat16_13 = (-u_xlat16_13) + half(1.0);
    u_xlat16_1.z = sqrt(u_xlat16_13);
    u_xlat16_2.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_1.xyz));
    u_xlat16_2.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_1.xyz));
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_2.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat12 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat3.xyz = float3(u_xlat12) * input.TEXCOORD4.xyz;
    u_xlat16_1.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, half2(0.0, 0.0));
    u_xlat16_5.x = log2(u_xlat16_1.y);
    u_xlat16_9 = FGlobals._Shininess * half(128.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_9;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_5.x = u_xlat16_0.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xxx * FGlobals._LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_1.xyz = fma(u_xlat16_2.xyz, u_xlat16_1.xxx, u_xlat16_5.xyz);
    u_xlati12 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati12 = u_xlati12 * 0x7;
    u_xlat16_1.xyz = u_xlat16_1.xyz * UnityInstancing_PerDraw2[u_xlati12 / 7].unity_SHCArray.www;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_1.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlat16_9.x = (-u_xlat16_3.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlati6 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati6 * 0x7;
    u_xlat16_9.x = (-u_xlat16_3.x) + UnityInstancing_PerDraw2[u_xlati6 / 7].unity_SHCArray.w;
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 2
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlati6 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati6 * 0x7;
    u_xlat16_9.x = (-u_xlat16_3.x) + UnityInstancing_PerDraw2[u_xlati6 / 7].unity_SHCArray.w;
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 3
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_BumpMap" to slot 1 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (394 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  VectorHalf4 _LightColor0 at 384
  ScalarHalf _Shininess at 392
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 2 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    half4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    half4 _LightColor0;
    half _Shininess;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]]  [[ flat ]];
};

struct Mtl_FragmentOut
{
    half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(2) ]],
    sampler sampler_ShadowMapTexture [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpMap [[ sampler (2) ]],
    texture2d<half, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<half, access::sample > _BumpMap [[ texture(1) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    float3 u_xlat1;
    float3 u_xlat2;
    half3 u_xlat16_3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    half3 u_xlat16_9;
    half u_xlat16_15;
    float u_xlat18;
    half u_xlat16_21;
    u_xlat0.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = input.TEXCOORD1.w;
    u_xlat1.y = input.TEXCOORD2.w;
    u_xlat1.z = input.TEXCOORD3.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat6.x = (-u_xlat0.x) + u_xlat18;
    u_xlat0.x = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat6.x, u_xlat0.x);
    u_xlat0.x = fma(u_xlat0.x, float(FGlobals._LightShadowData.z), float(FGlobals._LightShadowData.w));
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.xyz = input.TEXCOORD2.www * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0].xyz, input.TEXCOORD1.www, u_xlat6.xyz);
    u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2].xyz, input.TEXCOORD3.www, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
    u_xlat6.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat6.xy, saturate(u_xlat6.z), level(0.0));
    u_xlat16_3.x = (-FGlobals._LightShadowData.x) + half(1.0);
    u_xlat16_3.x = half(fma(u_xlat6.x, float(u_xlat16_3.x), float(FGlobals._LightShadowData.x)));
    u_xlati6 = int(input.SV_InstanceID0) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati6 * 0x7;
    u_xlat16_9.x = (-u_xlat16_3.x) + UnityInstancing_PerDraw2[u_xlati6 / 7].unity_SHCArray.w;
    u_xlat16_3.x = half(fma(u_xlat0.x, float(u_xlat16_9.x), float(u_xlat16_3.x)));
    u_xlat16_0.xy = _BumpMap.sample(sampler_BumpMap, input.TEXCOORD0.xy).yw;
    u_xlat16_4.xy = fma(u_xlat16_0.yx, half2(2.0, 2.0), half2(-1.0, -1.0));
    u_xlat16_9.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
    u_xlat16_9.x = min(u_xlat16_9.x, half(1.0));
    u_xlat16_9.x = (-u_xlat16_9.x) + half(1.0);
    u_xlat16_4.z = sqrt(u_xlat16_9.x);
    u_xlat16_5.x = dot(input.TEXCOORD1.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.y = dot(input.TEXCOORD2.xyz, float3(u_xlat16_4.xyz));
    u_xlat16_5.z = dot(input.TEXCOORD3.xyz, float3(u_xlat16_4.xyz));
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * float3(u_xlat16_5.xyz);
    u_xlat16_9.x = dot(u_xlat0.xyz, float3(FGlobals._WorldSpaceLightPos0.xyz));
    u_xlat18 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * input.TEXCOORD4.xyz;
    u_xlat16_9.y = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_9.xy = max(u_xlat16_9.xy, half2(0.0, 0.0));
    u_xlat16_15 = log2(u_xlat16_9.y);
    u_xlat16_21 = FGlobals._Shininess * half(128.0);
    u_xlat16_15 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat16_15 = u_xlat16_0.w * u_xlat16_15;
    u_xlat16_4.xyz = half3(u_xlat16_15) * FGlobals._LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * FGlobals._LightColor0.xyz;
    u_xlat16_9.xyz = fma(u_xlat16_5.xyz, u_xlat16_9.xxx, u_xlat16_4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    output.SV_Target0.xyz = fma(u_xlat16_0.xyz, input.TEXCOORD5.xyz, u_xlat16_3.xyz);
    output.SV_Target0.w = half(1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (432 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 352
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 336
  Vector4 _MainTex_ST at 416
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat18 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat18) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat0.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.w = u_xlat0.y;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat0.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = fma(u_xlat3.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (176 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 96
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  VectorHalf4 unity_SHAr at 24
  VectorHalf4 unity_SHAg at 32
  VectorHalf4 unity_SHAb at 40
  VectorHalf4 unity_SHBr at 48
  VectorHalf4 unity_SHBg at 56
  VectorHalf4 unity_SHBb at 64
  VectorHalf4 unity_SHC at 72
  Vector4 unity_WorldTransformParams at 80
  Vector4 _MainTex_ST at 160
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    half4 u_xlat16_0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat18;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat0.x = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.x = u_xlat1.z;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    u_xlat0.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), u_xlat1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    output.TEXCOORD4.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_0 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat1.xyz = u_xlat1.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat1.xyz = max(u_xlat1.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat1.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 48
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_WorldTransformParams at 32
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float4 u_xlat3;
    half3 u_xlat16_4;
    half3 u_xlat16_5;
    float3 u_xlat6;
    int u_xlati6;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati6 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = rsqrt(u_xlat6.x);
    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat6.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat6.xyz));
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat19);
    output.TEXCOORD1.y = u_xlat6.x;
    output.TEXCOORD1.x = u_xlat2.z;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat6.y;
    output.TEXCOORD3.y = u_xlat6.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    u_xlat6.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, u_xlat1.xxx, u_xlat7.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    output.TEXCOORD4.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_4.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_4.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_5.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
    u_xlat16_5.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
    u_xlat16_5.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
    u_xlat16_4.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_5.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_5.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_5.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  VectorHalf4 unity_SHAr at 152
  VectorHalf4 unity_SHAg at 160
  VectorHalf4 unity_SHAb at 168
  VectorHalf4 unity_SHBr at 176
  VectorHalf4 unity_SHBg at 184
  VectorHalf4 unity_SHBb at 192
  VectorHalf4 unity_SHC at 200
  Vector4 unity_WorldTransformParams at 208
  Vector4 _MainTex_ST at 288
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    half4 unity_SHAr;
    half4 unity_SHAg;
    half4 unity_SHAb;
    half4 unity_SHBr;
    half4 unity_SHBg;
    half4 unity_SHBb;
    half4 unity_SHC;
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    half4 u_xlat16_1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    half3 u_xlat16_4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    float3 u_xlat6;
    float u_xlat19;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati0 = u_xlati0 << 0x3;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat6.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat1 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat1);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat1.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    output.TEXCOORD1.x = u_xlat1.z;
    u_xlat19 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat2.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = fma(u_xlat2.yzx, u_xlat1.yzx, (-u_xlat3.xyz));
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.TEXCOORD1.y = u_xlat3.x;
    output.TEXCOORD1.z = u_xlat2.x;
    output.TEXCOORD1.w = u_xlat6.x;
    output.TEXCOORD2.x = u_xlat1.x;
    output.TEXCOORD3.x = u_xlat1.y;
    output.TEXCOORD2.w = u_xlat6.y;
    output.TEXCOORD2.y = u_xlat3.y;
    output.TEXCOORD3.y = u_xlat3.z;
    output.TEXCOORD2.z = u_xlat2.y;
    output.TEXCOORD3.w = u_xlat6.z;
    output.TEXCOORD3.z = u_xlat2.z;
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat3.xyz = (-u_xlat6.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat1.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    output.TEXCOORD4.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = half(u_xlat2.y * u_xlat2.y);
    u_xlat16_4.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_4.x))));
    u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
    u_xlat16_5.x = dot(VGlobals.unity_SHBr, u_xlat16_1);
    u_xlat16_5.y = dot(VGlobals.unity_SHBg, u_xlat16_1);
    u_xlat16_5.z = dot(VGlobals.unity_SHBb, u_xlat16_1);
    u_xlat16_4.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat16_4.xxx, u_xlat16_5.xyz);
    u_xlat2.w = 1.0;
    u_xlat16_5.x = half(dot(float4(VGlobals.unity_SHAr), u_xlat2));
    u_xlat16_5.y = half(dot(float4(VGlobals.unity_SHAg), u_xlat2));
    u_xlat16_5.z = half(dot(float4(VGlobals.unity_SHAb), u_xlat2));
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, half3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(float3(u_xlat16_4.xyz));
    u_xlat3.xyz = u_xlat3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = fma(u_xlat3.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat3.xyz = max(u_xlat3.xyz, float3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat6.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat5 = (-u_xlat6.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat6.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat2.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat2.zzzz, u_xlat4);
    u_xlat1 = fma(u_xlat5, u_xlat5, u_xlat1);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat1);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat2.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat0.www, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 2
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL INSTANCING_ON LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 3
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Tangent"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (256 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  VectorHalf4 _WorldSpaceLightPos0 at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  VectorHalf4 unity_4LightAtten0 at 80
  VectorHalf4 unity_LightColor[8] at 88
  Vector4 unity_WorldTransformParams at 160
  Vector4 _MainTex_ST at 240
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}
Constant Buffer "UnityInstancing_PerDraw0" (256 bytes) on slot 2 {
  Struct unity_Builtins0Array [128][2] at 0 {
    Matrix4x4 unity_ObjectToWorldArray at 0
    Matrix4x4 unity_WorldToObjectArray at 64
  }
}
Constant Buffer "UnityInstancing_PerDraw2" (112 bytes) on slot 3 {
  Struct unity_Builtins2Array [56][2] at 0 {
    VectorHalf4 unity_SHArArray at 0
    VectorHalf4 unity_SHAgArray at 8
    VectorHalf4 unity_SHAbArray at 16
    VectorHalf4 unity_SHBrArray at 24
    VectorHalf4 unity_SHBgArray at 32
    VectorHalf4 unity_SHBbArray at 40
    VectorHalf4 unity_SHCArray at 48
  }
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    half4 _WorldSpaceLightPos0;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    half4 unity_4LightAtten0;
    half4 unity_LightColor[8];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_Builtins0Array_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
    float4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};

struct UnityInstancing_PerDraw0_Type
{
    unity_Builtins0Array_Type unity_Builtins0Array[2];
};

struct unity_Builtins2Array_Type
{
    half4 unity_SHArArray;
    half4 unity_SHAgArray;
    half4 unity_SHAbArray;
    half4 unity_SHBrArray;
    half4 unity_SHBgArray;
    half4 unity_SHBbArray;
    half4 unity_SHCArray;
};

struct UnityInstancing_PerDraw2_Type
{
    unity_Builtins2Array_Type unity_Builtins2Array[2];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    half3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
    uint SV_InstanceID0 [[ user(SV_InstanceID0) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const constant unity_Builtins0Array_Type* UnityInstancing_PerDraw0 [[ buffer(2) ]],
    const constant unity_Builtins2Array_Type* UnityInstancing_PerDraw2 [[ buffer(3) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance ]],
    Mtl_VertexIn input [[ stage_in ]])
{
#if !UNITY_SUPPORT_INDIRECT_BUFFERS
    mtl_BaseInstance = 0;
#endif
    mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float3 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    half4 u_xlat16_2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    half3 u_xlat16_5;
    half3 u_xlat16_6;
    float3 u_xlat7;
    int u_xlati7;
    float u_xlat14;
    float u_xlat22;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlati7 = u_xlati0 << 0x3;
    u_xlati0 = u_xlati0 * 0x7;
    u_xlat1 = input.POSITION0.yyyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat2 = u_xlat1 + UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat1.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat3 = u_xlat2.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat2.xxxx, u_xlat3);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat2.zzzz, u_xlat3);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat2.wwww, u_xlat3);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.TANGENT0.yyy * UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].yzx;
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].yzx, input.TANGENT0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].yzx, input.TANGENT0.zzz, u_xlat2.xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
    output.TEXCOORD1.x = u_xlat2.z;
    u_xlat14 = input.TANGENT0.w * VGlobals.unity_WorldTransformParams.w;
    u_xlat3.x = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat3.y = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat3.z = dot(input.NORMAL0.xyz, UnityInstancing_PerDraw0[u_xlati7 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
    u_xlat4.xyz = fma(u_xlat3.yzx, u_xlat2.yzx, (-u_xlat4.xyz));
    u_xlat7.xyz = float3(u_xlat14) * u_xlat4.xyz;
    output.TEXCOORD1.y = u_xlat7.x;
    output.TEXCOORD1.z = u_xlat3.x;
    output.TEXCOORD1.w = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat2.x;
    output.TEXCOORD3.x = u_xlat2.y;
    output.TEXCOORD2.w = u_xlat1.y;
    output.TEXCOORD2.y = u_xlat7.y;
    output.TEXCOORD3.y = u_xlat7.z;
    output.TEXCOORD2.z = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat1.z;
    output.TEXCOORD3.z = u_xlat3.z;
    u_xlat7.x = dot(VGlobals._WorldSpaceLightPos0.xyz, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.x = rsqrt(u_xlat7.x);
    u_xlat7.xyz = u_xlat7.xxx * float3(VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.xyz = (-u_xlat1.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat7.xyz = fma(u_xlat2.xyz, float3(u_xlat22), u_xlat7.xyz);
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    output.TEXCOORD4.xyz = u_xlat7.xyz * float3(u_xlat22);
    u_xlat16_5.x = half(u_xlat3.y * u_xlat3.y);
    u_xlat16_5.x = half(fma(u_xlat3.x, u_xlat3.x, (-float(u_xlat16_5.x))));
    u_xlat16_2 = half4(u_xlat3.yzzx * u_xlat3.xyzz);
    u_xlat16_6.x = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
    u_xlat16_6.y = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
    u_xlat16_6.z = dot(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
    u_xlat16_5.xyz = fma(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHCArray.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
    u_xlat3.w = 1.0;
    u_xlat16_6.x = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHArArray), u_xlat3));
    u_xlat16_6.y = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAgArray), u_xlat3));
    u_xlat16_6.z = half(dot(float4(UnityInstancing_PerDraw2[u_xlati0 / 7].unity_SHAbArray), u_xlat3));
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(float3(u_xlat16_5.xyz));
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat3.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat3.xxxx, u_xlat4);
    u_xlat3 = fma(u_xlat1, u_xlat3.zzzz, u_xlat4);
    u_xlat2 = fma(u_xlat5, u_xlat5, u_xlat2);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat2);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, float4(VGlobals.unity_4LightAtten0), float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat3.xyz = u_xlat1.yyy * float3(VGlobals.unity_LightColor[1].xyz);
    u_xlat3.xyz = fma(float3(VGlobals.unity_LightColor[0].xyz), u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[2].xyz), u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(float3(VGlobals.unity_LightColor[3].xyz), u_xlat1.www, u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.xyz = half3(u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    output.SV_InstanceID0 = mtl_InstanceID;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

 }
}
Fallback "Mobile/VertexLit"
}