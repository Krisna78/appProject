import 'package:flutter/material.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
      ),
      body: SafeArea(
        child: ListView(),
      ),
    );
  }
}
