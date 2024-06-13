import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/models/profile/data.dart';
import 'package:project_team_3/models/profile/profile.dart';
import 'package:project_team_3/models/profile/siswa.dart';

class ProfileView extends StatelessWidget {
  final List<String> listGender;
  final String id;
  ProfileView({super.key, required this.listGender, required this.id});
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final datePickerController = TextEditingController();
  final genderController = TextEditingController();
  final alamatController = TextEditingController();
  final noTelpController = TextEditingController();
  final namaLengkapController = TextEditingController();
  final profilControl = Get.find<UpdateProfile>();

  void _showMessageUpdate(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Data Berhasil di update',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profilControl.showDataProfile(id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error : ${snapshot.data}");
        } else {
          final dataAPi = snapshot.data!;
          userController.text = "${dataAPi.data!.name}";
          emailController.text = "${dataAPi.data!.email}";
          final images =
              "https://codinggo.my.id/uploaded_files/${dataAPi.data!.image}";
          if (dataAPi.data!.siswa != null) {
            alamatController.text = "${dataAPi.data!.siswa.alamat}";
            noTelpController.text = "${dataAPi.data!.siswa.noTelp}";
            namaLengkapController.text = "${dataAPi.data!.siswa.namaLengkap}";
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Obx(() {
                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: profilControl.image.value != null
                        ? FileImage(profilControl.image.value!)
                        : NetworkImage(images) as ImageProvider,
                    child: profilControl.image.value == null ? null : null,
                  );
                }),
                const SizedBox(height: 20),
                TextFieldPage(
                  controller: userController,
                  hintText: "Username",
                ),
                const SizedBox(height: 15),
                TextFieldPage(
                  controller: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 15),
                TextFieldPage(
                  controller: alamatController,
                  hintText: "Alamat",
                ),
                const SizedBox(height: 15),
                TextFieldPage(
                  controller: noTelpController,
                  hintText: "No Telp",
                ),
                const SizedBox(height: 15),
                TextFieldPage(
                    controller: namaLengkapController,
                    hintText: "Nama Lengkap"),
                const SizedBox(height: 15),
                MyButton(
                  isLoading: false,
                  onTap: () async {
                    Siswa siswas = Siswa(
                      alamat: alamatController.text,
                      noTelp: noTelpController.text,
                      namaLengkap: namaLengkapController.text,
                    );
                    Data data = Data(
                      email: emailController.text,
                      name: userController.text,
                      siswa: siswas,
                    );
                    Profile update = Profile(
                      data: data,
                    );
                    await profilControl.updateProfile(update, id);
                  },
                  nameBtn: "Update",
                ),
                const SizedBox(height: 20),
              ],
            );
          } else if (dataAPi.data!.siswa == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Obx(() {
                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: profilControl.image.value != null
                        ? FileImage(profilControl.image.value!)
                        : NetworkImage(images) as ImageProvider,
                    child: profilControl.image.value == null
                        ? Center(child: Text("No Image"))
                        : null,
                  );
                }),
                const SizedBox(height: 20),
                TextFieldPage(
                  controller: userController,
                  hintText: "Username",
                ),
                const SizedBox(height: 15),
                TextFieldPage(
                  controller: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 15),
                MyButton(
                  onTap: () async {
                    final pickedFile =
                        await profilControl.pickImageFromGallery();
                    if (pickedFile != null) {
                      profilControl.setImage(File(pickedFile.path));
                    } else {
                      print('No image selected.');
                    }
                  },
                  nameBtn: "Unggah Foto",
                  isLoading: false,
                ),
                const SizedBox(height: 15),
                MyButton(
                  isLoading: false,
                  onTap: () async {
                    Data data = Data(
                      email: emailController.text,
                      name: userController.text,
                      siswa: null,
                    );
                    Profile update = Profile(
                      data: data,
                    );
                    await profilControl.updateProfile(update, id);
                  },
                  nameBtn: "Update",
                ),
              ],
            );
          }
        }
        return Center(
          child: Text("Tidak ada Profile yang terlihat"),
        );
      },
    );
  }
}
