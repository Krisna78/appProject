import 'package:flutter/material.dart';

class DescriptionCource extends StatelessWidget {
  final String valueDescription;
  DescriptionCource({super.key, required this.valueDescription});

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
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            valueDescription,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
