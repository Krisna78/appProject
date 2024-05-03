import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<DateTime>? onChanged;
  const DatePicker({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_month),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        readOnly: true,
        onTap: () {
          _showDatePicker(context);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mohon untuk mengisi tanggal lahir anda";
          }
          return null;
        },
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1992),
      lastDate: DateTime(2100),
    );
    if (picked != null && onChanged != null) {
      onChanged!(picked);
      final dateformat = DateFormat('dd MMMM yyyy').format(picked).toString();
      controller.text = dateformat;
    }
  }
}
