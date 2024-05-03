import 'package:get/get.dart';
import 'package:project_team_3/controllers/AuthController.dart';

class Global {
  static Future<void> init() async {
    Get.lazyPut(() => AuthController());
  }
}
