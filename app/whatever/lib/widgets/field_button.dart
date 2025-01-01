import 'package:flutter/material.dart';
import 'package:whatever/utils/app_radius.dart';

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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circular16,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
