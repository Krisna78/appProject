import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_team_3/Auth/login_page.dart';
import 'package:project_team_3/component/buttom_navigation.dart';
import 'package:project_team_3/models/users.dart';
import 'package:project_team_3/models/sqlHelper.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final String apiConnect = "192.168.1.11:80";
  final LocalDatabase localDatabase = LocalDatabase();

  var image = Rx<File?>(null);
  final picker = ImagePicker();

  void setImage(File file) {
    image.value = file;
  }

  void deleteImage() {
    image.value = null;
  }

  Future pickImageFromGallery() async {
    final pickFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      image.value = File(pickFile.path);
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

  void _showMessageRegister(BuildContext context, Users user) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Wow, Awesome ${user.username}',
      desc: 'Email : ${user.email}',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Get.off(() => LoginPage());
      },
    ).show();
  }

  void _showMessageDialog(BuildContext context, Users user) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Welcom back, ${user.username}',
      desc: 'See what new news right now you have!',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Get.off(() => NavigationButtom(
              user: user,
              id: user.id,
            ));
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

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final String apiUrl = "http://$apiConnect/api/apiTest/login";
      final responses = await http.post(Uri.parse(apiUrl),
          body: {'email': email, 'password': password});
      if (responses.statusCode == 200 || responses.statusCode == 201) {
        final jsonData =
            json.decode(responses.body.toString()) as Map<String, dynamic>;
        Users data = Users.fromJson(jsonData['data']);
        _showMessageDialog(context, data);
      } else {
        _showFailDialog(context);
      }
    } catch (e) {
      e.printError();
      print("error");
    }
  }

  Future<void> register(String username, String email, String password,
      String jenisKelamin, BuildContext context) async {
    try {
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      String randomID = randomNumber.toString();

      final String apiUrl = "http://$apiConnect/api/apiTest";
      var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
      request.fields['id_user'] = randomID;
      request.fields['username'] = username;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['jenis_kelamin'] = jenisKelamin;
      if (image.value != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.value!.path));
      }
      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        final jsonData = json.decode(responseData);
        Users data = Users.fromJson(jsonData['data']);
        _showMessageRegister(context, data);
        deleteImage();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      e.printError();
    }
  }
}
