How to Use [libeq2pasbridge] from NoGUI DataModule based library project:

> Go to your "Android Studio" projec "main" folder and create the "jniLibs" sub-folder
> Copy the "*.so" file from "jni/libs/armeabi-v7a" [or like...] to your "Android Studio" project "jniLibs/armeabi-v7a" folder [just example...]
> Sync your "Android Studio" project...
    
    
//.....
//Use example coding...
public class MainActivity extends AppCompatActivity {
 
   Eq2PasBridge myNativelib = new Eq2PasBridge();  //declare it !
 
   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
 
      int sum = myNativelib.Sum(12, 17);   //use it !
 
      Toast.makeText(getApplicationContext(), "myNativelib.Sum(12,17) = " + sum, Toast.LENGTH_LONG).show();
   }
   //.....
}
