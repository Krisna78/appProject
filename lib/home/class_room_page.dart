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
      body: GestureDetector(
          onTap: () {
            Get.to(() => DetailCourceView(id_cource: id));
          },
          child: Column(children: [
            FutureBuilder(
              future: classControl.classRoom(id),
              builder: (context, snapshot) {
                if (ConnectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error : ${snapshot.error}"));
                } else {
                  final dataAPI = snapshot.data;
                  print(id);
                  if (dataAPI != null && dataAPI.data != null) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final datum = dataAPI.data![index];
                        return Container(
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
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 255, 127, 63),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "8",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  const Text(
                                    "Make Form HTML",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      animation: true,
                                      lineHeight: 15,
                                      animationDuration: 1000,
                                      percent: 0.7,
                                      barRadius: const Radius.circular(10),
                                      backgroundColor:
                                          Color.fromARGB(255, 53, 109, 192),
                                      progressColor:
                                          Color.fromARGB(255, 255, 127, 63),
                                    ),
                                  ),
                                  const Text("70%",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Data Tidak ada"),
                    );
                  }
                }
              },
            )
          ])),
    );
  }
}
