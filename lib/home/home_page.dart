import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/controllers/updateProfileController.dart';
import 'package:project_team_3/home/cources/detailCource.dart';
import 'package:project_team_3/home/notifications_details.dart';

import '../models/cource/cource.dart';

class HomePage extends StatefulWidget {
  final String? username;
  HomePage({super.key, this.username});
  final profilControl = Get.find<UpdateProfile>();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "Beginner",
    "Intermediate",
    "Advance",
  ];
  bool isSearching = false;
  String? selectedCategory;
  final searchControl = TextEditingController();
  final courceController = Get.find<CourceController>();
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  Future<Cource> getCourceFuture() {
    if (isSearching) {
      return courceController.searchCource(searchControl.text);
    } else if (selectedCategory != null) {
      return courceController.searchCource(selectedCategory!);
    } else {
      return courceController.showData();
    }
  }

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
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            margin: const EdgeInsets.only(top: 10),
                            child: Obx(() {
                              if (widget.profilControl.username.value.isEmpty) {
                                return Text(
                                  "Hello, ${widget.username}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    wordSpacing: 2,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  softWrap: false,
                                );
                              } else {
                                return Text(
                                  "Hello, ${widget.profilControl.username.value}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    wordSpacing: 2,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  softWrap: false,
                                );
                              }
                            }),
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
                      margin: const EdgeInsets.only(top: 5, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: searchControl,
                            textInputAction: TextInputAction.search,
                            onFieldSubmitted: (value) {
                              setState(() {
                                isSearching = value.isNotEmpty;
                                selectedCategory = null;
                              });
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                      color:
                                          Color.fromARGB(255, 255, 127, 63))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
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
                              suffixIcon: searchControl.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        searchControl.clear();
                                        setState(() {
                                          isSearching = false;
                                          selectedCategory = null;
                                        });
                                      })
                                  : null,
                              hintText: "Cari kursus...",
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
                          "Level",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: ElevatedButton(
                            onPressed: () {
                              selectedCategory = categories[index];
                              isSearching = false;
                              searchControl.clear();
                            },
                            child: Text(categories[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: getCourceFuture(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                                childAspectRatio: 0.6,
                              ),
                              // itemCount: dataAPI.data!.length,
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
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "https://codinggo.my.id/uploaded_files/${datum.thumb}",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.21,
                                            width: double.infinity,
                                            errorWidget:
                                                (context, url, error) =>
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
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                datum.title ??
                                                    "Judul tidak tersedia",
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
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        datum.tutor?.name ??
                                                            "Nama tutor tidak tersedia",
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                  ),
                  //     Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(5),
                  //           child: SizedBox(
                  //             height: MediaQuery.of(context).size.height * 0.53,
                  //             child: FutureBuilder(
                  //               future: courceController.showData(),
                  //               builder: (context, snapshot) {
                  //                 if (snapshot.connectionState ==
                  //                     ConnectionState.waiting) {
                  //                   return const Center(
                  //                       child: CircularProgressIndicator());
                  //                 } else if (snapshot.hasError) {
                  //                   return Center(
                  //                       child: Text("Error : ${snapshot.error}"));
                  //                 } else {
                  //                   final dataAPI = snapshot.data;
                  //                   if (dataAPI != null && dataAPI.data != null) {
                  //                     return ListView.builder(
                  //                       scrollDirection: Axis.horizontal,
                  //                       itemCount: dataAPI.data!.length,
                  //                       itemBuilder: (context, index) {
                  //                         final datum = dataAPI.data![index];
                  //                         return CardCource(
                  //                           id: datum.idCource!,
                  //                           image: datum.image!,
                  //                           nameCource: datum.nameCource!,
                  //                           price: formatter.format(datum.price),
                  //                           width:
                  //                               MediaQuery.of(context).size.width *
                  //                                   0.6,
                  //                         );
                  //                       },
                  //                     );
                  //                   } else {
                  //                     return Center(
                  //                       child: Text("Tidak ada Data Error "),
                  //                     );
                  //                   }
                  //                 }
                  //               },
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
