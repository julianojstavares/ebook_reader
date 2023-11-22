import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final int index;

  const CoverWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.blue,
        ),
        Text("$index"),
        Positioned(
          top: -7,
          right: -10,
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.bookmark_border,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
