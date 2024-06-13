import 'package:flutter/material.dart';

class CommentCource extends StatelessWidget {
  const CommentCource({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 21),
      padding: const EdgeInsets.all(12),
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
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                child: Text(
                  "D",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                maxRadius: 25,
              ),
              SizedBox(width: 10),
              Text(
                "Dandhi Aria",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "\" it was good learning about cource, i like video make more intresting to me \"",
            style: TextStyle(fontSize: 16),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
