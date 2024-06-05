import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/textfield_password.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';

class UpdatePassword extends StatelessWidget {
  final String id;
  UpdatePassword({super.key, required this.id});
  final passwordControl = TextEditingController();
  final confirmControl = TextEditingController();
  final oldPassControl = TextEditingController();
  final updateControl = Get.find<UpdateProfile>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ubah Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(height: 15),
              PasswordInputField(
                  controller: passwordControl, hintText: "Password baru"),
              const SizedBox(height: 15),
              PasswordInputField(
                  controller: confirmControl, hintText: "Konfirmasi Password"),
              const SizedBox(height: 15),
              MyButton(
                  onTap: () async {
                    if (passwordControl.text != confirmControl.text) {
                      Get.snackbar(
                        'Error',
                        'Password baru dan konfirmasi password tidak cocok',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      updateControl.updatePassword(
                          context, id, confirmControl.text);
                    }
                  },
                  nameBtn: "Ubah Password",
                  isLoading: false),
            ],
          ),
        ),
      ),
    );
  }
}
