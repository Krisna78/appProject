import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/CourceController.dart';

class MateriCource extends StatelessWidget {
  final String id;
  MateriCource({super.key, required this.id});
  final viewMateriControl = Get.find<CourceController>();
  @override
  Widget build(BuildContext context) {
    return Container(
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
              future: viewMateriControl.viewMateri(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
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
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(datum.id);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                margin: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 255, 127, 63),
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
    );
  }
}
