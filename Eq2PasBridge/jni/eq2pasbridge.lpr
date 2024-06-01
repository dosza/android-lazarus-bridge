library eq2pasbridge;        //[by LAMW [NoGUI]:01/06/2024 10:54:14]
  
{$mode delphi}
  
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, jni,
  java_call_bridge_Eq2PasBridge, ueq2pasbridge;
  
type
  
  TNoGUIApp = class(TCustomApplication)
  public
      jClassName: string;  //ex.  org/lamw/appnoguidemo1/AcbrJBridges1
      AppName: string;
      procedure CreateForm(InstanceClass: TComponentClass; out Reference);
      constructor Create(TheOwner: TComponent); override;
      destructor Destroy; override;
  end;
  
procedure TNoGUIApp.CreateForm(InstanceClass: TComponentClass; out Reference);
var
  Instance: TComponent;
begin
  Instance := TComponent(InstanceClass.NewInstance);
  TComponent(Reference):= Instance;
  Instance.Create(Self);
end;
  
constructor TNoGUIApp.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;
  
destructor TNoGUIApp.Destroy;
begin
  inherited Destroy;
end;
  
var
  NoGUIApp: TNoGUIApp;

{%region /fold 'LAMW generated code'}

{ Class:     com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge
  Method:    isSoluble
  Signature: (III)Z }
function isSoluble(PEnv: PJNIEnv; this: JObject; a: JInt; b: JInt; c: JInt
  ): JBoolean; cdecl;
begin
  Result:=Java_Call_isSoluble(PEnv, this, a, b, c);
end;

{ Class:     com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge
  Method:    getDelta
  Signature: (III)F }
function getDelta(PEnv: PJNIEnv; this: JObject; a: JInt; b: JInt; c: JInt
  ): JFloat; cdecl;
begin
  Result:=Java_Call_getDelta(PEnv, this, a, b, c);
end;

{ Class:     com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge
  Method:    getX
  Signature: (FII)[F }
function getX(PEnv: PJNIEnv; this: JObject; delta: JFloat; b: JInt; c: JInt
  ): JFloatArray; cdecl;
begin
  Result:=Java_Call_getX(PEnv, this, delta, b, c);
end;

const NativeMethods: array[0..2] of JNINativeMethod = (
   (name: 'isSoluble';
    signature: '(III)Z';
    fnPtr: @isSoluble; ),
   (name: 'getDelta';
    signature: '(III)F';
    fnPtr: @getDelta; ),
   (name: 'getX';
    signature: '(FII)[F';
    fnPtr: @getX; )
);

function RegisterNativeMethodsArray(PEnv: PJNIEnv; className: PChar; 
  methods: PJNINativeMethod; countMethods: integer): integer;
var
  curClass: jClass;
begin
  Result:= JNI_FALSE;
  curClass:= (PEnv^).FindClass(PEnv, className);
  if curClass <> nil then
    result := (PEnv^).RegisterNatives(PEnv, curClass, methods, countMethods);
end;

function RegisterNativeMethods(PEnv: PJNIEnv; className: PChar): integer;
begin
  Result:= RegisterNativeMethodsArray(PEnv, className, @NativeMethods[0], Length
    (NativeMethods));
end;

function JNI_OnLoad(VM: PJavaVM; {%H-}reserved: pointer): JInt; cdecl;
var
  PEnv: PPointer;
  curEnv: PJNIEnv;
  rc: integer;
begin
  PEnv:= nil;
  Result:= JNI_VERSION_1_6;
  
  if (VM^).GetEnv(VM, @PEnv, Result) <> JNI_OK then
  begin
   result := JNI_ERR;
   exit;
  end;
  
  if PEnv <> nil then
  begin
     curEnv:= PJNIEnv(PEnv);
     rc := RegisterNativeMethods(curEnv, 'com/dosza/appeq2solverbridge/eq2'
       +'pasbridge/Eq2PasBridge');
     if (rc <> JNI_OK) then result := rc;
  end;
end;

procedure JNI_OnUnload(VM: PJavaVM; {%H-}reserved: pointer); cdecl;
var
  PEnv: PPointer;
  curEnv: PJNIEnv;
begin
  PEnv:= nil;
  
  if (VM^).GetEnv(VM, @PEnv, JNI_VERSION_1_6) <> JNI_OK then exit;
  
  if PEnv <> nil then
  begin
    curEnv:= PJNIEnv(PEnv);
  end;
end;

exports
  JNI_OnLoad name 'JNI_OnLoad',
  JNI_OnUnload name 'JNI_OnUnload',
  isSoluble name 'Java_com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge_'
    +'isSoluble',
  getDelta name 'Java_com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge_'
    +'getDelta',
  getX name 'Java_com_dosza_appeq2solverbridge_eq2pasbridge_Eq2PasBridge_getX';

{%endregion}
  
begin
  NoGUIApp:= TNoGUIApp.Create(nil);
  NoGUIApp.Title:= 'LAMW NoGUI JNI Android Library';
  NoGUIApp.jClassName:= 
    'com/dosza/appeq2solverbridge/eq2pasbridge/Eq2PasBridge';
  NoGUIApp.Initialize;
  NoGUIApp.CreateForm(TNoGUIAndroidModule1, NoGUIAndroidModule1);
end.
