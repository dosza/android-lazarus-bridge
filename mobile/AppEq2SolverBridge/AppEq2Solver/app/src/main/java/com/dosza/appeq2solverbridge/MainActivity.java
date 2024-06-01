package com.dosza.appeq2solverbridge;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.dosza.appeq2solverbridge.eq2pasbridge.Eq2PasBridge;

import java.security.InvalidParameterException;

public class MainActivity extends AppCompatActivity {
    private TextView inputA, inputB, inputC;
    private Eq2PasBridge eq2solver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        inputA = findViewById(R.id.inputA);
        inputB = findViewById(R.id.inputB);
        inputC = findViewById(R.id.inputC);
        eq2solver = new Eq2PasBridge();
    }

    public void solver(View v) {
        try {
            int a, b, c;
            float delta,x1,x2;

            a = Integer.valueOf(inputA.getText().toString());
            b = Integer.valueOf(inputB.getText().toString());
            c = Integer.valueOf(inputC.getText().toString());

            delta = eq2solver.getDelta(a, b, c);
            x1 = eq2solver.getX1(delta,b,c);
            x2 = eq2solver.getX2(delta,b,c);
           // float[] x = eq2solver.getX(delta, b, c);
            Toast.makeText(getApplicationContext(), "S = { "  + x1 + ","+ x2 + " }", Toast.LENGTH_LONG).show();
        } catch (InvalidParameterException e) {
            Log.e("JNI_Loading_libcontrols", "exception", e);
            Toast.makeText(getApplicationContext(), " S = { }" + "\n Sem solução!", Toast.LENGTH_LONG).show();
        }


    }
}
