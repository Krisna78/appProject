import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_team_3/component/buttom_navigation.dart';
import 'package:project_team_3/models/users.dart';
import 'package:project_team_3/models/sqlHelper.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final String apiConnect = "192.168.1.15:80";
  final LocalDatabase localDatabase = LocalDatabase();

  void _showMessageRegister(BuildContext context, String username,String email) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Wow, Awesome $username',
      desc: 'Email : $email',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", (Route<dynamic> route) => false);
      },
    ).show();
  }

  void _showMessageDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Welcom back, $message',
      desc: 'See what new news right now you have!',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Get.off(() => NavigationButtom(usernames: message));
      },
    ).show();
  }

  void _showFailDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'Oh no, You can\'t Log In',
      desc: 'Check Your Email and Password!',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  // Future<void> registerUser(Users user) async {
  //   try {
  //     await localDatabase.insertData(user);
  //   } catch (e) {
  //     print('Error register: $e');
  //   }
  // }

  // Future<void> loginUser(Users user, BuildContext context) async {
  //   try {
  //     var res = await localDatabase.login(user);
  //     if (res != null) {
  //       _showMessageDialog(context, res);
  //     } else {
  //       _showFailDialog(context);
  //     }
  //   } catch (e) {
  //     print('Error login: $e');
  //   }
  // }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiTest/login";
      final responses = await http.post(Uri.parse(apiUrl),
          body: {'email': email, 'password': password});
      if (responses.statusCode == 200 || responses.statusCode == 201) {
        final jsonData = json.decode(responses.body.toString()) as Map<String, dynamic>;
        Users data = Users.fromJson(jsonData['data']);
        _showMessageDialog(context, data.username);
      } else {
        print('Failed to load data. Status code: ${responses.statusCode}');
      }
    } catch (e) {
      e.printError();
    }
  }

  Future<void> register(String username, String email, String password,
      String jenisKelamin, BuildContext context) async {
    try {
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      String randomID = randomNumber.toString();

      final String apiUrl = "http://$apiConnect/api/apiTest";
      final response = await http.post(Uri.parse(apiUrl), body: {
        'id': '$randomID',
        'username': username,
        'email': email,
        'password': password,
        'jenis_kelamin': jenisKelamin
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        Users data = Users.fromJson(jsonData['data']);
        _showMessageRegister(context,data.username,data.email);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      e.printError();
    }
  }
}
