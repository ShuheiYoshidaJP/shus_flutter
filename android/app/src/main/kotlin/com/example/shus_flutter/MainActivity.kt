import androidx.annotation.NonNull
import com.example.shus_flutter.`interface`.NativeChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = NativeChannel(flutterEngine.dartExecutor.binaryMessenger)
        channel.setCallHandler()
    }

}
