import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/home/profiles/component/detail_profile.dart';

class UpdateProfileForm extends StatelessWidget {
  final int id;
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final datePickerController = TextEditingController();
  final genderController = TextEditingController();

  UpdateProfileForm({super.key, required this.id});
  final profilControl = Get.find<UpdateProfile>();

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
              child: ProfileView(listGender: dropdownOptions, id: id),
            ),
          ),
        ),
      ),
    );
  }
}
