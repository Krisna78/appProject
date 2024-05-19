import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_team_3/component/card_cource.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/cources/detailCource.dart';

class CourcePage extends StatelessWidget {
  CourcePage({super.key});
  final searchControl = TextEditingController();
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
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFieldPage(
                    controller: searchControl, hintText: "Cari sesukamu !!"),
                const SizedBox(height: 20),
                SizedBox(
                  height: 630,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: courceController.showData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error : ${snapshot.error}"),
                        );
                      } else {
                        final dataAPI = snapshot.data;
                        if (dataAPI != null && dataAPI.data != null) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.68,
                            ),
                            itemCount: dataAPI.data!.length,
                            itemBuilder: (context, index) {
                              final datum = dataAPI.data![index];
                              return GestureDetector(
                                onTap: () async {
                                  Get.to(() => DetailCourceView(
                                        id_cource: datum.idCource as int,
                                        price: formatter.format(datum.price),
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0.8,
                                        blurRadius: 3,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          "assets/images/logo_biru2.png",
                                          height: 120,
                                        ),
                                      ),
                                      Text(
                                        "${datum.nameCource}",
                                        style: const TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 25,
                                          ),
                                          Text(
                                            "4.5 (110)",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Budi Handayani",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "${formatter.format(datum.price)}",
                                            style: const TextStyle(
                                              fontSize: 21,
                                              color: Color.fromARGB(
                                                  255, 255, 153, 0),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("Kursus masih tidak ada"),
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
