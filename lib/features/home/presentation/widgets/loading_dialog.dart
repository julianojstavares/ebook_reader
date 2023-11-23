import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String title;

  const LoadingDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Aguarde")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Abrindo livro $title",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
