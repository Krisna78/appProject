import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/datepicker.dart';
import 'package:project_team_3/component/dropdown.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/models/profile_siswa/data.dart';
import 'package:project_team_3/models/profile_siswa/profile_siswa.dart';
import 'package:project_team_3/models/profile_siswa/siswa.dart';

class ProfileView extends StatelessWidget {
  final List<String> listGender;
  final int id;
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
          userController.text = "${dataAPi.data!.username}";
          emailController.text = "${dataAPi.data!.email}";
          final images = dataAPi.data!.image;
          if (dataAPi.data!.jenisKelamin == 'laki-laki') {
            genderController.text = "Male";
          } else if (dataAPi.data!.jenisKelamin == 'perempuan') {
            genderController.text = "Female";
          } else {
            genderController.text = "No Gender";
          }
          if (dataAPi.data!.siswa != null) {
            alamatController.text = "${dataAPi.data!.siswa.alamat}";
            noTelpController.text = "${dataAPi.data!.siswa.noTelp}";
            namaLengkapController.text = "${dataAPi.data!.siswa.namaLengkap}";
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                CircleAvatar(
                  backgroundImage: NetworkImage(images),
                  maxRadius: 65,
                ),
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
                DatePicker(
                    controller: datePickerController,
                    hintText: "Date Birth",
                    onChanged: (DateTime pickedDate) {
                      datePickerController.text = pickedDate.toString();
                    }),
                const SizedBox(height: 15),
                CustomDropdown(
                  options: listGender,
                  selectedOption: listGender.first,
                  onChanged: (String value) {
                    genderController.text = value;
                  },
                ),
                const SizedBox(height: 10),
                MyButton(
                  isLoading: false,
                  onTap: () async {
                    String gender;
                    if (genderController.text == "Male") {
                      gender = "laki-laki";
                    } else {
                      gender = "perempuan";
                    }
                    Siswa siswas = Siswa(
                      alamat: alamatController.text,
                      noTelp: noTelpController.text,
                      namaLengkap: namaLengkapController.text,
                    );
                    Data data = Data(
                      email: emailController.text,
                      jenisKelamin: gender,
                      username: userController.text,
                      siswa: siswas,
                    );
                    ProfileSiswa update = ProfileSiswa(
                      data: data,
                    );
                    profilControl.updateProfile(update, id);
                    _showMessageUpdate(context);
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
                CircleAvatar(
                  backgroundImage: NetworkImage(images),
                  maxRadius: 65,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  isEmailField: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                DatePicker(
                    controller: datePickerController,
                    hintText: "Date Birth",
                    onChanged: (DateTime pickedDate) {
                      datePickerController.text = pickedDate.toString();
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  options: listGender,
                  selectedOption: listGender.first,
                  onChanged: (String value) {
                    genderController.text = value;
                  },
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  isLoading: false,
                    onTap: () {
                      // Get.to();
                    },
                    nameBtn: "Lengkapi Data Diri"),
                const SizedBox(height: 10),
                MyButton(
                  isLoading: false,
                    onTap: () async {
                      String gender;
                      if (genderController.text == "Male") {
                        gender = "laki-laki";
                      } else {
                        gender = "perempuan";
                      }
                      Data data = Data(
                        email: emailController.text,
                        jenisKelamin: gender,
                        username: userController.text,
                        siswa: null,
                      );
                      ProfileSiswa update = ProfileSiswa(
                        data: data,
                      );
                      profilControl.updateProfile(update, id);
                      _showMessageUpdate(context);
                    },
                    nameBtn: "Update")
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
