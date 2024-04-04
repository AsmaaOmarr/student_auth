import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';

class GenderSelection extends StatefulWidget {
  final String initialSelection;
  final void Function(String) onChanged;

  const GenderSelection({
    super.key,
    required this.initialSelection,
    required this.onChanged,
  });

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              updateSelection('male');
            },
            child: GenderContainer(
              gender: 'male',
              isSelected: selectedGender == 'male',
              text: 'Male',
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              updateSelection('female');
            },
            child: GenderContainer(
              gender: 'female',
              isSelected: selectedGender == 'female',
              text: 'Female',
            ),
          ),
        ],
      ),
    );
  }

  void updateSelection(String gender) {
    setState(() {
      selectedGender = gender;
      widget.onChanged(selectedGender); // Notify the parent about the change
    });
  }
}

class GenderContainer extends StatelessWidget {
  final String text;
  final String gender;
  final bool isSelected;

  const GenderContainer(
      {Key? key,
      required this.gender,
      required this.isSelected,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected
            ? (gender == 'male'
                ? Colors.blue.shade100.withOpacity(0.76)
                : Constant.kLightPink.withOpacity(0.48))
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: isSelected
              ? (gender == 'male' ? Colors.blue : Constant.kPink)
              : Colors.transparent,
          width: 1, // Adjust border width
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(gender == 'male' ? Icons.man : Icons.girl_outlined,
              color: isSelected
                  ? (gender == 'male' ? Colors.blue : Constant.kPink)
                  : Colors.grey.shade400,
              size: gender == 'male' ? 22 : 26),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: Constant.kFontFamily,
              color: isSelected
                  ? (gender == 'male' ? Colors.blue : Constant.kPink)
                  : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
