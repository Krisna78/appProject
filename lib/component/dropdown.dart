import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.options,
    this.selectedOption,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: DropdownButtonFormField<String>(
        value: _selectedOption,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Select Gender",
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue!);
          }
        },
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
