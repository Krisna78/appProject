import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_team_3/component/card_cource.dart';
import 'package:project_team_3/component/listHorizontal.dart';
import 'package:project_team_3/controllers/CourceController.dart';
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
  final courceController = Get.find<CourceController>();
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                                      color:
                                          Color.fromARGB(255, 255, 127, 63))),
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 320,
                          child: FutureBuilder(
                            future: courceController.showData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error : ${snapshot.error}"));
                              } else {
                                final dataAPI = snapshot.data;
                                if (dataAPI != null && dataAPI.data != null) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: dataAPI.data!.length,
                                    itemBuilder: (context, index) {
                                      final datum = dataAPI.data![index];
                                      return CardCource(
                                        id: datum.idCource!,
                                        nameCource: datum.nameCource!,
                                        price: formatter.format(datum.price),
                                        width: 230,
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: Text("Tidak ada Data Error "),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
