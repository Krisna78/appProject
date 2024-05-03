import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/models/users.dart';
import 'package:http/http.dart' as http;

class UpdateProfile extends GetxController{
  final String apiConnect = "10.10.183.73:80";

  void _showMessageUpdate(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Data Berhasil di update',
      // desc: 'Email : $email',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", (Route<dynamic> route) => false);
      },
    ).show();
  }
  Future<void> updateProfile(Users user) async {
    int id = user.id;
    try {
      final String apiUrl = "http://$apiConnect/api/apiTest/{$id}";
      final response = await http.put(Uri.parse(apiUrl),body: user);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Users data = Users.fromJson(response.body);
      }
    } catch (e) {
      e.printError();
    }
  }
  Future<Users> showDataProfile(int id) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiGet/{$id}";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Users data = Users.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception("Gagal mendapatkan data");
      }
    } catch (e) {
      e.printError();
      throw e;
    }
  }
}