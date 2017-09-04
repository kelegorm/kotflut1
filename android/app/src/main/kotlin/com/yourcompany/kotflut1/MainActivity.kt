package com.yourcompany.kotflut1

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.view.WindowManager.LayoutParams;

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterView
import org.jetbrains.anko.*

class MainActivity: FlutterActivity(), AnkoLogger {

  val REMINDER_ACTION = "com.yourcompany.kotflut1.addReminder"
  val ADD_REMINDER_ROUTE = ":reminder"


  lateinit var messageChannel: BasicMessageChannel<String>

  private val CHANNEL = "increment"


  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    messageChannel = BasicMessageChannel<String>(flutterView, CHANNEL, StringCodec.INSTANCE)
    val ert : BasicMessageChannel.MessageHandler<String> = BasicMessageChannel.MessageHandler(function =
        {s, reply ->
          reply.reply("")
          if (s == "make_icon") createShortcut()
        }
    )
    messageChannel.setMessageHandler(ert)

    GeneratedPluginRegistrant.registerWith(this)
  }

  override fun createFlutterView(context: Context?): FlutterView {
    val view = FlutterView(this)
    view.layoutParams = LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT)
    setContentView(view)

    if (intent.action == REMINDER_ACTION) {
      view.setInitialRoute(ADD_REMINDER_ROUTE)
    }

    return view
  }

  override fun onNewIntent(intent: Intent?) {
    super.onNewIntent(intent)

    if (intent?.action == REMINDER_ACTION) {
      flutterView.pushRoute(ADD_REMINDER_ROUTE)
    }
  }

  fun createShortcut() {
    val createReminderIntent = Intent(this, MainActivity::class.java)
    createReminderIntent.action = REMINDER_ACTION

    val createShortcutIntent = Intent()
    createShortcutIntent.action = "com.android.launcher.action.INSTALL_SHORTCUT"
    createShortcutIntent.putExtra("duplicate", false)
    createShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_INTENT, createReminderIntent)
    createShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_NAME, "Reminder")
    createShortcutIntent.putExtra(Intent.EXTRA_SHORTCUT_ICON_RESOURCE, Intent.ShortcutIconResource.fromContext(this, R.mipmap.ic_launcher))
    sendBroadcast(createShortcutIntent)
  }
}
