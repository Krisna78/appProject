import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/datepicker.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/component/dropdown.dart';

class UpdateProfileForm extends StatefulWidget {
  UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final _formKey = GlobalKey<FormState>();
    final userController = TextEditingController();
  final emailController = TextEditingController();
  final datePickerController = TextEditingController();
  final genderController = TextEditingController();
    List<String> dropdownOptions = ['Male', 'Female', 'No Gender'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  TextFieldPage(
                    controller: userController,
                    hintText: "Username",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldPage(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DatePicker(
                    controller : datePickerController,
                    hintText: "Date Birth",
                    onChanged: (DateTime pickedDate){
                      datePickerController.text = pickedDate.toString();
                    }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropdown(
                    options: dropdownOptions,
                    selectedOption: dropdownOptions.first,
                    onChanged: (String value) {
                      genderController.text = value;
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
