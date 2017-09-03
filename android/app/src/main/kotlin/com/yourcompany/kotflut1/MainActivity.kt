package com.yourcompany.kotflut1

import android.content.Intent
import android.os.Bundle
import android.view.View

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant
import org.jetbrains.anko.*

class MainActivity: FlutterActivity(), AnkoLogger {

  val REMINDER_ACTION = "com.yourcompany.kotflut1.addReminder"
  val ADD_REMINDER_ROUTE = "/reminder"


  lateinit var messageChannel: BasicMessageChannel<String>

  private val CHANNEL = "increment"


  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    if (intent.action == REMINDER_ACTION) {
      info("intent action is add reminder, so pushing route")
      flutterView.pushRoute(ADD_REMINDER_ROUTE)
    }

    messageChannel = BasicMessageChannel<String>(flutterView, CHANNEL, StringCodec.INSTANCE)
    val ert : BasicMessageChannel.MessageHandler<String> = BasicMessageChannel.MessageHandler(function =
        {s, reply -> info("got message: $s");
          reply.reply("");
          if (s == "make_icon") createShortcut();
          info("intent was: ${intent.action}")
        }
    )
    messageChannel.setMessageHandler(ert)

    GeneratedPluginRegistrant.registerWith(this)

    info(intent.action)
  }

  override fun onStart() {
    super.onStart()
    info("on start")
    flutterView.pushRoute(ADD_REMINDER_ROUTE)
  }

  override fun onResume() {
    super.onResume()
    info("on resume")
  }


  fun createShortcut() {
    val shortcutIntent = Intent(this, MainActivity::class.java)
    shortcutIntent.action = REMINDER_ACTION//Intent.ACTION_MAIN

    val intent = Intent()
    intent.putExtra(Intent.EXTRA_SHORTCUT_INTENT, shortcutIntent)
    intent.putExtra(Intent.EXTRA_SHORTCUT_NAME, applicationInfo.name)
    intent.putExtra(Intent.EXTRA_SHORTCUT_ICON_RESOURCE, Intent.ShortcutIconResource.fromContext(this, R.mipmap.ic_launcher))
    intent.action = "com.android.launcher.action.INSTALL_SHORTCUT"
    sendBroadcast(intent)

    info("Made app shortcut")
  }
}
