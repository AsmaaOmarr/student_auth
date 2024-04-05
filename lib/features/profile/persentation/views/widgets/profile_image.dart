import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img_temp.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade200,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.add,
                    size: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
