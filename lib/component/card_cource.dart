// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_team_3/controllers/CourceController.dart';
import 'package:project_team_3/home/cources/detailCource.dart';

class CardCource extends StatelessWidget {
  final int id;
  final String nameCource;
  final String? price;
  final double? width;
  CardCource({
    super.key,
    required this.id,
    required this.nameCource,
    this.price,
    this.width,
  });
  final courceController = Get.find<CourceController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.to(() => DetailCourceView(id_cource: id,price: "$price",));
        courceController.showData();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10, bottom: 14, left: 10, right: 10),
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "assets/images/logo_biru2.png",
                  height: 150,
                ),
              ),
              Text(
                "$nameCource",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Budi Handayani",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 6,
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
                    "4.5",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "$price",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
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
