
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? value;
  final void Function(String?)? onChanged;

  const CustomDropdownButton({
    super.key,
    this.value,
    this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  static const List<String> _items = [
    "Select Level",
    "Level 1",
    "Level 2",
    "Level 3",
    "Level 4"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400, width: 0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: widget.value,
                  onChanged: widget.onChanged,
                  underline: SizedBox(), // Remove underline
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.transparent,
                  ),
                  items: _items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontFamily: Constant.kFontFamily,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
