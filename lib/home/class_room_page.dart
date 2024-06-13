import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/classroom/detail_cource_class.dart';

class ClassroomPage extends StatelessWidget {
  final String id;
  ClassroomPage({super.key, required this.id});
  final classControl = Get.find<CourceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kelas Saya"),
      ),
      body: FutureBuilder(
        future: classControl.classRoom(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final dataAPI = snapshot.data;
            if (dataAPI != null &&
                dataAPI.data != null &&
                dataAPI.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: dataAPI.data!.length,
                itemBuilder: (context, index) {
                  final datum = dataAPI.data![index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          DetailCourceView(id_cource: "${datum.playlistId}"));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 3,
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${datum.playlistTitle}",
                            style: const TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("Data Tidak ada"));
            }
          } else {
            return Center(child: Text("Data Tidak ada"));
          }
        },
      ),
    );
  }
}
