import 'package:flutter/material.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/component/textfield_password.dart';
import 'package:project_team_3/Auth/register_page.dart';
import 'package:project_team_3/controllers/AuthController.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();
  final authControl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/images/logo_biru2.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldPage(
                    controller: emailSignInController,
                    hintText: 'Email',
                    isEmailField: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordInputField(
                    controller: passwordSignInController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Users userLogin = Users(
                          //     email: emailSignInController.text,
                          //     password: passwordSignInController.text);
                          // var user = {
                          //   "email" : emailSignInController,
                          //   "password" : passwordSignInController,
                          // };
                          authControl.login(emailSignInController.text,
                              passwordSignInController.text, context);
                        }
                      },
                      nameBtn: "Sign In"),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Atau",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member ?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 127, 63),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
