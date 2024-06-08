import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_team_3/home/classroom/detail_cource_class.dart';

class ClassCource extends StatefulWidget {
  ClassCource({super.key});

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
      body: GestureDetector(
        onTap: () {
          Get.to(() => DetailCourceView(id_cource: "1"));
        },
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => DetailCourceView(id_cource: "1"));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: EdgeInsets.all(12),
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
                      "Basic HTML",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 127, 63),
                          ),
                          child: Center(
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
                        Text(
                          "Make Form HTML",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 100,
                            animation: true,
                            lineHeight: 15,
                            animationDuration: 1000,
                            percent: 0.7,
                            barRadius: const Radius.circular(10),
                            backgroundColor: Color.fromARGB(255, 53, 109, 192),
                            progressColor: Color.fromARGB(255, 255, 127, 63),
                          ),
                        ),
                        Text("70%",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
