import 'package:flutter/material.dart';

class VideoTutorial extends StatelessWidget {
  const VideoTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Tutorial"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Text("data ini kosong"),
        ),
      ),
    );
  }
}
