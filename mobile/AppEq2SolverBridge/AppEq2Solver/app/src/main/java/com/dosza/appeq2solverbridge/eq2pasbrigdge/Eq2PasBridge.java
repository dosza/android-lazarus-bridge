package com.dosza.appeq2solverbridge.eq2pasbrigdge;

import android.util.Log;

public class Eq2PasBridge {

    static {
        try {
            System.loadLibrary("eq2pasbridge");
        } catch (UnsatisfiedLinkError e) {
            Log.e("JNI_Loading_libcontrols", "exception", e);
        }

    }

    public native boolean isSoluble(int a, int b, int c);

    public native float getDelta(int a, int b, int c);

    public native float[] getX(float delta, int b, int c);

}