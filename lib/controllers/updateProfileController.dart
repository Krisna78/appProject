import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:project_team_3/Auth/login_page.dart';
import 'package:project_team_3/controllers/connect.dart';
import 'package:project_team_3/models/profile/profile.dart';

class UpdateProfile extends GetxController {
  final String apiConnect = APINum;
  var username = "".obs;
  var email = "".obs;
  var image = Rx<File?>(null);
  final picker = ImagePicker();

  void setImage(File file) {
    image.value = file;
  }

  void deleteImage() {
    image.value = null;
  }

  Future pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print("===== No Image selected =====");
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('==== No image selected. =======');
    }
  }

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

  void _showMessageUpdatePassword(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Data Berhasil di update',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> updateProfile(Profile profileSiswa, String id_data) async {
    try {
      final String apiUrl =
          "https://$apiConnect/api/apiTest/profile/update/$id_data";
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Tambahkan field teks
      request.fields['name'] = profileSiswa.data!.name ?? '';
      request.fields['email'] = profileSiswa.data!.email ?? '';

      if (profileSiswa.data!.siswa != null) {
        request.fields['nama_lengkap'] =
            profileSiswa.data!.siswa!.namaLengkap ?? '';
        request.fields['no_telp'] = profileSiswa.data!.siswa!.noTelp ?? '';
        request.fields['alamat'] = profileSiswa.data!.siswa!.alamat ?? '';
      }

      // Tambahkan file gambar jika ada
      if (image.value != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.value!.path));
      }

      // Kirim permintaan
      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseData);
        username.value = profileSiswa.data!.name!;
        email.value = profileSiswa.data!.email!;
        _showMessageUpdate(Get.context!);
      } else {
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating profile: $e');
      e.printError();
    }
  }

  Future<Profile> showDataProfile(String id) async {
    try {
      final String apiUrl = "https://$apiConnect/api/apiTest/profile/$id";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final profileData = Profile.fromMap(jsonData);
        return profileData;
      } else {
        throw Exception("Failed ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePassword(
      BuildContext context, String id, String newPass) async {
    try {
      final String apiUrl = "https://$apiConnect/api/apiTest/updatePassword/$id";
      final response =
          await http.post(Uri.parse(apiUrl), body: {"password": newPass});
      final jsonData = json.decode(response.body);
      if (jsonData["success"] == true) {
        _showMessageUpdate(context);
      } else {
        print(jsonData["success"]);
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> updatePasswordByEmail(String email, String newPass) async {
    try {
      final String apiUrl =
          "https://$apiConnect/api/apiTest/updatePasswordByEmail";
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "email": email,
          "password": newPass,
        },
      );
      final jsonData = json.decode(response.body);
      if (jsonData["message"] == 'Password berhasil diperbarui') {
        _showMessageUpdate(Get.context!);
      } else {
        print(jsonData["message"]);
      }
    } catch (e) {
      throw Exception();
    }
  }
}
