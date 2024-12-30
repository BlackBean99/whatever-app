import 'package:flutter/material.dart';

class FieldButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const FieldButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
