import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/classroom/tutorial.dart';

class DetailCourceView extends StatefulWidget {
  final String id_cource;
  DetailCourceView({
    super.key,
    required this.id_cource,
  });
  final viewMateriControl = Get.find<CourceController>();

  @override
  State<DetailCourceView> createState() => _DetailCourceViewState();
}

class _DetailCourceViewState extends State<DetailCourceView> {
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
              future:
                  Get.find<CourceController>().detailCource(widget.id_cource),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  courseData = snapshot.data;
                  if (courseData != null && courseData.data != null) {
                    return buildDetailContent();
                  } else {
                    return Center(child: Text("Tidak Ada Data"));
                  }
                } else {
                  return Center(child: Text("Tidak Ada Data"));
                }
              },
            )
          : buildDetailContent(),
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
                    "https://codinggo.my.id/uploaded_files/${courseData.data!.thumb}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
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
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 28,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://codinggo.my.id/uploaded_files/${courseData.data!.tutor!.image}",
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
            const SizedBox(height: 25),
            Container(
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
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: widget.viewMateriControl
                          .viewMateri(courseData.data!.idCource),
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
                          final dataApi = snapshot.data;
                          if (dataApi != null && dataApi.data!.isNotEmpty) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: dataApi.data!.length,
                              itemBuilder: (context, index) {
                                final datum = dataApi.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => MateriTutorial(
                                        id: "${datum.id}",
                                        nameContent: "${datum.title}",
                                        video: "${datum.video}",
                                        deskripsi: "${datum.description}",
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromARGB(255, 255, 127, 63),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Flexible(
                                        child: Text(
                                          datum.title!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Text("Materi masih belum ada"),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
