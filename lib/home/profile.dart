import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_team_3/component/small_card.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/home/classroom/class_cource.dart';
import 'package:project_team_3/home/profiles/updateProfile.dart';
import 'package:project_team_3/models/users.dart';

class ProfileUsers extends StatefulWidget {
  final int id;
  final String username;
  final Users user;
  ProfileUsers({
    super.key,
    required this.id,
    required this.username,
    required this.user,
  });
  @override
  State<ProfileUsers> createState() => _ProfileUsersState();
}

class _ProfileUsersState extends State<ProfileUsers> {
  final profilControl = Get.find<UpdateProfile>();
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
            GestureDetector(
              onTap: () {
                // Get.to(() => DetailProfile(id: widget.id));
              },
              child: Container(
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
                        backgroundImage: NetworkImage(widget.user.image),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.username,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.user.email,
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
            ),
            const SizedBox(height: 10),
            // * End Username Card * //
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
                      Get.to(() => UpdateProfileForm(id: widget.id));
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
                    onTap: () {
                      Get.to(() => ClassCource());
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // * SignOut Button * //
            GestureDetector(
              onTap: () {
                _showMessageDialog(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 4,
                        offset: Offset(0, 0.5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
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
