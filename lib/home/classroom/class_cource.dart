import 'package:flutter/material.dart';

class ClassCource extends StatefulWidget {
  const ClassCource({super.key});

  @override
  State<ClassCource> createState() => _ClassCourceState();
}

class _ClassCourceState extends State<ClassCource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kelas Saya"),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
