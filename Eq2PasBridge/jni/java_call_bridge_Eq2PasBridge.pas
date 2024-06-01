unit java_call_bridge_Eq2PasBridge;
 
{$mode delphi} 
 
interface
 
uses
  jni, jnihelper;
 
function Java_Call_isSoluble(env:PJNIEnv;this:JObject;a:integer;b:integer;c:integer):jBoolean;
function Java_Call_getDelta(env:PJNIEnv;this:JObject;a:integer;b:integer;c:integer):single;
function Java_Call_getX(env:PJNIEnv;this:JObject;delta:single;b:integer;c:integer):jfloatArray;
 
implementation
 
uses
  ueq2pasbridge;
 
function Java_Call_isSoluble(env:PJNIEnv;this:JObject;a:integer;b:integer;c:integer):jBoolean;
var
  outReturn: boolean;
begin
  outReturn:= NoGUIAndroidModule1.isSoluble(a,b,c);
  Result:=GetJBoolean(outReturn);
end;
function Java_Call_getDelta(env:PJNIEnv;this:JObject;a:integer;b:integer;c:integer):single;
var
  outReturn: single;
begin
  outReturn:= NoGUIAndroidModule1.getDelta(a,b,c);
  Result:=outReturn;
end;
function Java_Call_getX(env:PJNIEnv;this:JObject;delta:single;b:integer;c:integer):jfloatArray;
var
  outReturn: TDynArrayOfSingle;
begin
  outReturn:= NoGUIAndroidModule1.getX(delta,b,c);
  Result:=GetJObjectOfDynArrayOfSingle(env,outReturn);
end;
 
end. 
 
