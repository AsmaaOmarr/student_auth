
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 155,
          height: 0.2,
          color: Colors.black,
        ),
        Text(
          "   OR   ",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
            fontFamily: Constant.kFontFamily,
          ),
        ),
        Container(
          width: 155,
          height: 0.2,
          color: Colors.black,
        )
      ],
    );
  }
}
