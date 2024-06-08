import 'package:flutter/material.dart';
import 'package:project_team_3/home/class_room_page.dart';
import 'package:project_team_3/home/home_page.dart';
import 'package:project_team_3/home/profile.dart';
import 'package:project_team_3/models/users.dart';

class NavigationButtom extends StatefulWidget {
  final String id;
  final Users user;

  NavigationButtom({
    super.key,
    required this.id,
    required this.user,
  });
  @override
  State<NavigationButtom> createState() => _NavigationButtomState();
}

class _NavigationButtomState extends State<NavigationButtom> {
  int _selectedIndex = 0;
  late String _id;
  late List<Widget> tabs;
  late String data;

  void initState() {
    super.initState();
    _id = widget.id;
    data = widget.user!.image;
    tabs = [
      HomePage(username: widget.user!.name),
      ClassroomPage(
        id: _id,
      ),
      ProfileUsers(id: _id, username: widget.user!.name, user: widget.user!),
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
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 27),
            label: "Kelas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined, size: 27),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
