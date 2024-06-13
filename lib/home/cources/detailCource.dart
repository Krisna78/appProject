import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/cources/descriptionCource.dart';
import 'package:project_team_3/home/cources/materiCource.dart';

class DetailCourceView extends StatefulWidget {
  final String id_cource;
  final String price;
  DetailCourceView({
    super.key,
    required this.id_cource,
    required this.price,
  });
  final detailCourceControl = Get.find<CourceController>();
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  @override
  State<DetailCourceView> createState() => _DetailCourceViewState();
}

class _DetailCourceViewState extends State<DetailCourceView> {
  int contentIndex = 0;
  var courseData;

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
      body: courseData == null
          ? FutureBuilder(
              future: widget.detailCourceControl.detailCource(widget.id_cource),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error : ${snapshot.error}"));
                } else {
                  courseData = snapshot.data!;
                  return buildDetailContent();
                }
              },
            )
          : buildDetailContent(),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 53, 109, 192)),
              ),
              child: Text(
                "Beli",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailContent() {
    return SingleChildScrollView(
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
              child: CachedNetworkImage(
                imageUrl:
                    "http://192.168.1.8/uploaded_files/${courseData.data!.thumb}",
                errorWidget: (context, url, error) {
                  return Icon(Icons.error);
                },
                progressIndicatorBuilder: (context, url, progress) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${courseData.data!.title}",
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
                  maxRadius: 28,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://192.168.1.8/uploaded_files/${courseData.data!.tutor.image}",
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseData.data!.tutor!.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      courseData.data!.tutor!.profession,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
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
            contentIndex == 0
                ? MateriCource(id: courseData.data!.idCource)
                : DescriptionCource(
                    valueDescription: courseData.data!.deskripsi),
          ],
        ),
      ),
    );
  }
}
