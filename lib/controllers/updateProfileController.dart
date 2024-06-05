import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/connect.dart';
import 'package:project_team_3/models/profile/profile.dart';
import 'package:http/http.dart' as http;

class UpdateProfile extends GetxController {
  final String apiConnect = APINum;
  var username = "".obs;
  var email = "".obs;
  var iamge = "".obs;

  void _showMessageUpdate(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Data Berhasil di update',
      // desc: 'Email : $email',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> updateProfile(Profile profileSiswa, String id_data) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiTest/$id_data";
      if (profileSiswa.data!.siswa == null) {
        final response = await http.post(Uri.parse(apiUrl), body: {
          "username": profileSiswa.data!.username,
          "email": profileSiswa.data!.email,
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonData = jsonDecode(response.body);
          username.value = profileSiswa.data!.username!;
          email.value = profileSiswa.data!.email!;
        }
      } else if (profileSiswa.data!.siswa != null) {
        final response = await http.post(Uri.parse(apiUrl), body: {
          "username": profileSiswa.data!.username,
          "email": profileSiswa.data!.email,
          "nama_lengkap": profileSiswa.data!.siswa!.namaLengkap,
          "no_telp": profileSiswa.data!.siswa!.noTelp,
          "alamat": profileSiswa.data!.siswa!.alamat,
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonData = jsonDecode(response.body);
          username.value = profileSiswa.data!.username!;
          email.value = profileSiswa.data!.email!;
        }
      }
    } catch (e) {
      e.printError();
    }
  }

  Future<Profile> showDataProfile(String id) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiTest/profile/$id";
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
      final String apiUrl = "http://$apiConnect/api/apiTest/updatePassword/$id";
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
}
