import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/button.dart';
import 'package:project_team_3/component/small_card.dart';
import 'package:project_team_3/Auth/login_page.dart';
import 'package:project_team_3/controllers/AuthController.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/home/updateProfile.dart';
import 'package:project_team_3/models/users.dart';

class ProfileUsers extends StatefulWidget {
  final int? id;
  final String? username;

  ProfileUsers({
    super.key,
    this.id,
    this.username,
  });

  @override
  State<ProfileUsers> createState() => _ProfileUsersState();
}

class _ProfileUsersState extends State<ProfileUsers> {
  final authControl = Get.find<AuthController>();

  void _showMessageDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: 'Are you sure want leave ?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", (Route<dynamic> route) => false);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 55),
            // * Username Card * //
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 4,
                      offset: Offset(0, 0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.username}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.username}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // * General Card * //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 4,
                  offset: Offset(0, 0.5),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      "General",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10),
                  SmallCard(
                    title: "Edit Profile",
                    detailTitle: "Ubah Profile, Nomer Telp atau Avatar",
                    iconProfile: Icon(Icons.person),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileForm(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  SmallCard(
                    title: "Ubah Password",
                    detailTitle: "Ubah dan perkuat akun anda",
                    iconProfile: Icon(Icons.lock),
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  SmallCard(
                    title: "Kelas Saya",
                    detailTitle: "Lihat kelas yang anda lakukan saat ini",
                    iconProfile: Icon(Icons.class_rounded),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // * SignOut Button * //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 4,
                  offset: Offset(0, 0.5),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: () {
                  _showMessageDialog(context);
                },
                child: const Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.red,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
