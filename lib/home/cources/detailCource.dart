import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:project_team_3/home/cources/commentCource.dart';
import 'package:project_team_3/home/cources/descriptionCource.dart';
import 'package:project_team_3/home/cources/materiCource.dart';

class DetailCource extends StatefulWidget {
  final int id_cource;
  DetailCource({
    super.key,
    required this.id_cource,
  });

  @override
  State<DetailCource> createState() => _DetailCourceState();
}

class _DetailCourceState extends State<DetailCource> {
  int contentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Image.asset("assets/images/logo_biru2.png"),
              ),
              SizedBox(height: 10),
              Text(
                "Basic HTML",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.orange,
                  ),
                  Text(
                    "4.5 (110)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo_biru2.png"),
                    maxRadius: 28,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Budi Handayani",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Front End Web Developer",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        contentIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: contentIndex == 0
                          ? Color.fromARGB(255, 255, 127, 63)
                          : Color.fromARGB(255, 53, 109, 192),
                    ),
                    child: Text(
                      "Materi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        contentIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: contentIndex == 1
                          ? Color.fromARGB(255, 255, 127, 63)
                          : Color.fromARGB(255, 53, 109, 192),
                    ),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              contentIndex == 0 ? MateriCource() : DescriptionCource(),
              SizedBox(height: 20),
              Text(
                "Ulasan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return CommentCource();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
