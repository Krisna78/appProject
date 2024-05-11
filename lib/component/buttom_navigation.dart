import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/home/home_page.dart';
import 'package:project_team_3/home/notifications_details.dart';
import 'package:project_team_3/home/profile.dart';
import 'package:project_team_3/models/users.dart';

class NavigationButtom extends StatefulWidget {
  final int id;
  final String usernames;

  const NavigationButtom({super.key,required this.id,required this.usernames});

  @override
  State<NavigationButtom> createState() => _NavigationButtomState();
}

class _NavigationButtomState extends State<NavigationButtom> {
  int _selectedIndex = 0;
  late String _username;
  late int _id;
  late String _email;
  late List<Widget> tabs;

  void initState() {
    super.initState();
    _id = widget.id;
    _username = widget.usernames;
    tabs = [
      HomePage(username: _username),
      NotificationDetails(),
      ProfileUsers(id: _id,username: _username),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 27),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 27),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined, size: 27),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
