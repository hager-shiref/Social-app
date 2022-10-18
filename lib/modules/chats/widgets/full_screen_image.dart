import 'package:flutter/material.dart';
import 'package:social/shared/icons.dart';

class FullScreenImage extends StatelessWidget {
  String? image;
  FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(image!),
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
