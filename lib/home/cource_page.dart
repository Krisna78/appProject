import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_team_3/component/card_cource.dart';
import 'package:project_team_3/component/textfield.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/cources/detailCource.dart';

import '../models/cource/cource.dart';

class CourcePage extends StatefulWidget {
  CourcePage({super.key});
  @override
  State<CourcePage> createState() => _CourcePageState();
}

class _CourcePageState extends State<CourcePage> {
  final searchControl = TextEditingController();
  bool isSearching = false;
  final courceController = Get.find<CourceController>();

  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  Future<Cource> getCourceFuture() {
    return isSearching
        ? courceController.searchCource(searchControl.text)
        : courceController.showData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: searchControl,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    setState(() {
                      isSearching = value.isNotEmpty;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 63))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 63))),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    suffixIcon: searchControl.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              searchControl.clear();
                              setState(() {
                                isSearching = false;
                              });
                            })
                        : null,
                    hintText: "Cari kursus...",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.77,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: getCourceFuture(),
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
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.57,
                            ),
                            itemCount: dataAPI.data!.length,
                            itemBuilder: (context, index) {
                              final datum = dataAPI.data![index];
                              return GestureDetector(
                                onTap: () async {
                                  Get.to(() => DetailCourceView(
                                        id_cource: "${datum.idCource}",
                                        price: formatter.format(datum.price),
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: "${datum.image}",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.205,
                                          width: double.infinity,
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          progressIndicatorBuilder:
                                              (context, url, progress) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${datum.title}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
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
