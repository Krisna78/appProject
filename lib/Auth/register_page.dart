import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/datepicker.dart';
import 'package:project_team_3/component/dropdown.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/component/textfield_password.dart';
import 'package:project_team_3/controllers/AuthController.dart';
import 'package:project_team_3/models/sqlHelper.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userSignUpController = TextEditingController();

  final emailSignUpController = TextEditingController();

  final passSignUPController = TextEditingController();

  final datePickerController = TextEditingController();

  final confirmPassSignUpController = TextEditingController();

  final genderSignUpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final LocalDatabase localDatabase = LocalDatabase();

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
                  const SizedBox(height: 40),
                  const Text(
                    "Come and Join Us!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
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
                    height: 15,
                  ),
                  Obx(() {
                    return authControl.image.value == null
                        ? Text("No image selected")
                        : Image.file(authControl.image.value!);
                  }),
                  DatePicker(
                    controller: datePickerController,
                    hintText: "Date Birth",
                    onChanged: (DateTime pickedDate) {
                      datePickerController.text = pickedDate.toString();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdown(
                    options: dropdownOptions,
                    selectedOption: dropdownOptions.first,
                    onChanged: (String value) {
                      genderSignUpController.text = value;
                    },
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
                      nameBtn: "Upload Image"),
                  MyButton(
                    nameBtn: "Sign Up",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        String? jns;
                        if (genderSignUpController.text == "Male") {
                          jns = "laki-laki";
                        } else if (genderSignUpController.text == "Female") {
                          jns = "perempuan";
                        } else {
                          jns = "laki-laki";
                        }
                        authControl.register(
                            userSignUpController.text,
                            emailSignUpController.text,
                            passSignUPController.text,
                            jns,
                            context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
