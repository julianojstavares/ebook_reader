import 'package:flutter/material.dart';

class FavoriteToggle extends StatefulWidget {
  const FavoriteToggle({
    super.key,
  });

  @override
  State<FavoriteToggle> createState() => _FavoriteToggleState();
}

class _FavoriteToggleState extends State<FavoriteToggle> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          favorite = !favorite;
        });
      },
      child: Visibility(
        visible: !favorite,
        replacement: const Icon(
          Icons.bookmark,
          size: 50,
          color: Colors.red,
        ),
        child: const Icon(
          Icons.bookmark_border,
          size: 50,
        ),
      ),
    );
  }
}
