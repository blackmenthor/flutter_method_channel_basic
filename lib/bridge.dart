
import 'package:flutter/services.dart';

class NativeBridge {

  static const messageChannel = const MethodChannel('com.anggach.flutternativesample/channel');
  static const methodHello = "HELLO";

  static Future<String> getMessageFromNative() async {
    String response = "";
    try {
      final String result = await messageChannel.invokeMethod(methodHello);
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    return response;
  }

}