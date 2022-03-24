import 'package:flutter/material.dart';

class ImageCircleWidget extends StatelessWidget {
  const ImageCircleWidget(
    this.image, {
    Key? key,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 115),
        height: 200.0,
        width: 200.0,
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
      ),
    );
  }
}
