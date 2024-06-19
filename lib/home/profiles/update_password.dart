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
  final updateControl = Get.find<UpdateProfile>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Password"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Ubah Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(height: 15),
              PasswordInputField(
                  controller: passwordControl, hintText: "Password Baru"),
              const SizedBox(height: 15),
              PasswordInputField(
                  controller: confirmControl, hintText: "Konfirmasi Password"),
              const SizedBox(height: 15),
              MyButton(
                  onTap: () async {
                    if (passwordControl.text.isEmpty || confirmControl.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Password tidak boleh kosong',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    if (passwordControl.text != confirmControl.text) {
                      Get.snackbar(
                        'Error',
                        'Password Baru dan Konfirmasi Password tidak cocok',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    await updateControl.updatePassword(
                        context, id, confirmControl.text);
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
