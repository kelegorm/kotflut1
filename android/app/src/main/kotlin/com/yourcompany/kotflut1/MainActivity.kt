package com.yourcompany.kotflut1

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant
import org.jetbrains.anko.*

class MainActivity: FlutterActivity(), AnkoLogger {

  lateinit var messageChannel: BasicMessageChannel<String>

  private val CHANNEL = "increment"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    //val intent = this.intent

    messageChannel = BasicMessageChannel<String>(flutterView, CHANNEL, StringCodec.INSTANCE)
    val ert : BasicMessageChannel.MessageHandler<String> = BasicMessageChannel.MessageHandler(function =
        {s, reply -> info("got message: $s"); reply.reply("")}
    )
    messageChannel.setMessageHandler(ert)

    GeneratedPluginRegistrant.registerWith(this)
  }
}
