import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';

import 'agora_model.dart';

class AgoraLogic extends GetxController {
  AgoraModel agoraModel = AgoraModel();
  AgoraModel agoraModelDefault = AgoraModel();
  late final RtcEngine _engine;
  String? userName;
  String? userImage;
  final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  leaveChannel() async {
    await _engine.leaveChannel();
  }
}
