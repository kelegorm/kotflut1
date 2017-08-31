package com.yourcompany.kotflut1

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
//import org.jetbrains.anko.*

class MainActivity(): FlutterActivity()/*, AnkoLogger*/ {

//  var messageChannel: BasicMessageChannel

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    val intent = getIntent()

    //info("1")

//    val flutterView = findViewById(R.id.flutter_view) as FlutterView
//    flutterView.runFromBundle(FlutterMain.findAppBundlePath(getApplicationContext()), null)

//    messageChannel = BasicMessageChannel<T>(flutterView, CHANNEL, StringCodec.INSTANCE)
//    messageChannel.setMessageHandler(obj: MessageHandler<String> {
//      @Override
//      override fun onMessage(s: String, reply: Reply<String>) {
//        onFlutterIncrement()
//        reply.reply(EMPTY_MESSAGE)
//        info("2")
//      }
//    })

    GeneratedPluginRegistrant.registerWith(this)
  }
}
