import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  final controller;
  final String hintText;
  final bool isEmailField;
  final TextInputType textInputType;

  const TextFieldPage(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isEmailField = false,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 14,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 127, 63))),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 127, 63))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Mohon isi bidang ini";
                // } else if (value.length < 8) {
                //   return "$hintText harus minimal 8 karakter";
              } else if (isEmailField && !isEmail(value.trim())) {
                return "Format email harus menggunakan '@'";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  bool isEmail(String value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(value);
  }
}
