import 'package:flutter/material.dart';
import 'package:project_team_3/component/card_cource.dart';
import 'package:project_team_3/component/listHorizontal.dart';
import 'package:project_team_3/home/notifications_details.dart';

class HomePage extends StatefulWidget {
  final String? username;

  HomePage({super.key, this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "UI/UX",
    "Mobile",
    "Front End Web",
    "Back End Web",
    "Machine learning",
    "Project Manager"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30, left: 15, right: 15, bottom: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 127, 63),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 3, bottom: 15),
                        child: Text(
                          "Hello, ${widget.username}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationDetails(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 127, 63),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 127, 63))),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: "Cari Kursus Sesukamu!!",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14, left: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Kategori",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text("See all"))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ListHorizontal(category: categories[index]);
                    },
                  ),
                ),
                CardCource(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
