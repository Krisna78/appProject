import 'package:get/get.dart';
import 'package:project_team_3/controllers/AuthController.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';

class Global {
  static Future<void> init() async {
    Get.lazyPut(() => AuthController());
    Get.put(CourceController());
    Get.put(UpdateProfile());
  }
}
