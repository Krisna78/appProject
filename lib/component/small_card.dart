import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SmallCard extends StatelessWidget {
  final String title;
  final String detailTitle;
  final Icon iconProfile;
  final Function()? onTap;

  const SmallCard({
    super.key,
    required this.title,
    required this.detailTitle,
    required this.iconProfile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFFF9843),
                  child: iconProfile,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      detailTitle,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 35,
          ),
        ],
      ),
    );
  }
}
