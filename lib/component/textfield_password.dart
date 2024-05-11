import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordInputField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: widget.controller,
        obscuringCharacter: "*",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 14),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 127, 63))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 127, 63))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade600)),
          fillColor: Colors.grey.shade100,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: isPasswordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        obscureText: isPasswordVisible,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mohon untuk mengisi ${widget.hintText}";
          } else if (value.length < 8) {
            return "Isi tidak boleh kurang dari 8 karakter";
          }
          return null;
        },
      ),
    );
  }
}
