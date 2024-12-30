import 'package:flutter/material.dart';

class LineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final bool isDisabled;

  const LineButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.width,
    this.isDisabled = false,
  });

  const LineButton.small({super.key, required this.text, this.onPressed})
      : width = 40,
        isDisabled = false;
  const LineButton.smallDisabled({super.key, required this.text})
      : width = 40,
        onPressed = null,
        isDisabled = true;
  const LineButton.medium({super.key, required this.text, this.onPressed})
      : width = 48,
        isDisabled = false;
  const LineButton.mediumDisabled({super.key, required this.text})
      : width = 48,
        onPressed = null,
        isDisabled = true;
  const LineButton.large({super.key, required this.text, this.onPressed})
      : width = 56,
        isDisabled = false;
  const LineButton.largeDisabled({super.key, required this.text})
      : width = 56,
        onPressed = null,
        isDisabled = true;
  const LineButton.xLarge({super.key, required this.text, this.onPressed})
      : width = 64,
        isDisabled = false;
  const LineButton.xLargeDisabled({super.key, required this.text})
      : width = 64,
        onPressed = null,
        isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        child: Text(text),
      ),
    );
  }
}
