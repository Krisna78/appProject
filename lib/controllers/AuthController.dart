import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_team_3/Auth/login_page.dart';
import 'package:project_team_3/component/buttom_navigation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:project_team_3/models/users.dart';
import 'package:project_team_3/controllers/connect.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String apiConnect = APINum;

  var image = Rx<File?>(null);
  var isLoading = false.obs;
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
      title: 'Selamat Datang, ${user.name}',
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
      title: 'Selamat datang kembali, ${user.name}',
      btnOkOnPress: () {
        Get.off(() => NavigationButtom(
              user: user,
              id: user.id,
            ));
      },
    ).show();
  }

  void showFailDialog(BuildContext context, String title, String desc) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }

  void _showLogOutDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: 'Anda yakin untuk keluar ?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();
        Get.offAll(LoginPage());
      },
    ).show();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    isLoading.value = true;
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none) {
      showFailDialog(context, "Tidak Ada Internet",
          "Cek internet anda, pastikan tersambung data internet");
      isLoading.value = false;
      return;
    }
    try {
      final String apiUrl = "https://$apiConnect/api/apiTest/login";
      final responses = await http.post(Uri.parse(apiUrl),
          body: {'email': email, 'password': password});
      if (responses.statusCode == 200 || responses.statusCode == 201) {
        final jsonData = jsonDecode(responses.body);
        if (jsonData["success"] == true) {
          Users data = Users.fromJson(jsonData['data']);
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setBool("isLoggedIn", true);
          await pref.setString("loginTime", DateTime.now().toIso8601String());
          await pref.setString("userData", jsonEncode(data));
          _showMessageDialog(context, data);
        } else {
          showFailDialog(context, "Email atau Password anda salah",
              "Cek kembali Email dan Password anda!");
        }
      } else {
        showFailDialog(context, "Email atau Password anda salah",
            "Cek kembali Email dan Password anda!");
      }
    } catch (e) {
      e.printError();
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String username, String email, String password,
      BuildContext context) async {
    isLoading.value = true;
    try {
      final String apiUrl = "https://$apiConnect/api/apiTest";
      var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
      request.fields['name'] = username;
      request.fields['email'] = email;
      request.fields['password'] = password;
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLoggedIn = pref.getBool("isLoggedIn");
    if (isLoggedIn == true) {
      String? loginTimeString = pref.getString('loginTime');
      if (loginTimeString != null) {
        DateTime loginTime = DateTime.parse(loginTimeString);
        if (DateTime.now().difference(loginTime).inDays < 3) {
          String? userDataString = pref.getString('userData');
          if (userDataString != null) {
            Users user = Users.fromJson(jsonDecode(userDataString));
            Get.off(() => NavigationButtom(id: user.id, user: user));
            return;
          }
        } else {
          await pref.clear();
        }
      }
    }
    Get.off(() => LoginPage());
  }

  Future<void> logout(BuildContext context) async {
    _showLogOutDialog(context);
  }
}
