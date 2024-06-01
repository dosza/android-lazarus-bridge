package com.dosza.appeq2solverbridge;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.dosza.appeq2solverbridge.eq2pasbridge.Eq2PasBridge;

public class MainActivity extends AppCompatActivity {
    private  TextView  inputA, inputB, inputC;
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
    public void solver(View v){
        int a,b,c;
        float delta;

        a = Integer.valueOf(inputA.getText().toString());
        b = Integer.valueOf(inputB.getText().toString());
        c = Integer.valueOf(inputC.getText().toString());

        if ( eq2solver.isSoluble(a,b,c)){
            delta = eq2solver.getDelta(a,b,c);
            float[] x = eq2solver.getX(delta,b,c);
            Toast.makeText(getApplicationContext(), "x1 = " + x[0], Toast.LENGTH_LONG).show();
            Toast.makeText(getApplicationContext(), "x2 = " + x[1], Toast.LENGTH_LONG).show();
        }else{
            Toast.makeText(getApplicationContext(), " S = { }"+ "\n Sem solução!" , Toast.LENGTH_LONG).show();
        }


    }
}
