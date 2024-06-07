import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/component/textfield_password.dart';
import 'package:project_team_3/controllers/AuthController.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userSignUpController = TextEditingController();
  final emailSignUpController = TextEditingController();
  final passSignUPController = TextEditingController();
  final confirmPassSignUpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authControl = Get.find<AuthController>();

  List<String> dropdownOptions = ['Male', 'Female', 'No Gender'];

  void deleteImageFromDevice() {
    if (authControl.image.value != null) {
      File imageFile = authControl.image.value!;
      if (imageFile.existsSync()) {
        imageFile.deleteSync();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Come and Join Us!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Obx(() {
                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: authControl.image.value != null
                          ? FileImage(authControl.image.value!)
                          : null,
                      child: authControl.image.value == null
                          ? Center(child: Text("No Image"))
                          : null,
                    );
                  }),
                  const SizedBox(height: 15),
                  TextFieldPage(
                    controller: userSignUpController,
                    hintText: "Username",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldPage(
                    controller: emailSignUpController,
                    hintText: "Email",
                    isEmailField: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordInputField(
                    controller: passSignUPController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordInputField(
                    controller: confirmPassSignUpController,
                    hintText: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                    onTap: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        // Mengirim file gambar ke controller
                        authControl.setImage(File(pickedFile.path));
                      } else {
                        print('No image selected.');
                      }
                    },
                    nameBtn: "Unggah Foto",
                    isLoading: false,
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    return MyButton(
                      nameBtn: "DAFTAR",
                      isLoading: authControl.isLoading.value,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (passSignUPController.text !=
                              confirmPassSignUpController.text) {
                            authControl.showFailDialog(context, "Perhatian!",
                                "Password dan Konfirmasi Password tidak sama");
                          } else {
                            authControl.register(
                              userSignUpController.text,
                              emailSignUpController.text,
                              passSignUPController.text,
                              context,
                            );
                          }
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
