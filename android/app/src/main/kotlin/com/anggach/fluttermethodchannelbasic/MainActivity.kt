package com.anggach.fluttermethodchannelbasic

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  private val channelName = "com.anggach.flutternativesample/channel"

  private val methodHello = "HELLO"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    setUpMethodChannel()
  }

  private fun setUpMethodChannel() {
    val methodChannel = MethodChannel(flutterView, channelName)
    methodChannel.setMethodCallHandler {
      methodCall, result -> handleMethodCall(methodCall, result)
    }
  }

  private fun handleMethodCall(
          methodCall: MethodCall, result: MethodChannel.Result) {
    when(methodCall.method) {
      methodHello -> hello(methodCall, result)
    }
  }

  private fun hello(methodCall: MethodCall, result: MethodChannel.Result) {
    result.success("HELLO FROM NATIVE SIDE!")
  }

}
