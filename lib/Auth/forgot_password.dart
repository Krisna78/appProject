// auth_update_password.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/component/textfield_password.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';

class AuthUpdatePassword extends StatelessWidget {
  AuthUpdatePassword({Key? key}) : super(key: key);

  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();
  final confirmControl = TextEditingController();
  final updateControl = Get.find<UpdateProfile>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Ubah Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              TextFieldPage(
                controller: emailControl,
                hintText: "Email",
                isEmailField: true,
              ),
              SizedBox(height: 15),
              PasswordInputField(
                controller: passwordControl,
                hintText: "Password baru",
              ),
              SizedBox(height: 15),
              PasswordInputField(
                controller: confirmControl,
                hintText: "Konfirmasi Password",
              ),
              SizedBox(height: 15),
              MyButton(
                onTap: () async {
                  if (passwordControl.text != confirmControl.text) {
                    Get.snackbar(
                      'Error',
                      'Password baru dan konfirmasi password tidak cocok',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    updateControl.updatePasswordByEmail(
                      emailControl.text,
                      passwordControl.text,
                    );
                  }
                },
                nameBtn: "Ubah Password",
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
