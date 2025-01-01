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
    required this.isDisabled,
  });

  const LineButton.small({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          width: width,
          isDisabled: false,
        );

  const LineButton.smallDisabled({
    Key? key,
    required String text,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: null,
          width: width,
          isDisabled: true,
        );

  const LineButton.medium({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          width: width,
          isDisabled: false,
        );

  const LineButton.mediumDisabled({
    Key? key,
    required String text,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: null,
          width: width,
          isDisabled: true,
        );

  const LineButton.large({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          width: width,
          isDisabled: false,
        );

  const LineButton.largeDisabled({
    Key? key,
    required String text,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: null,
          width: width,
          isDisabled: true,
        );

  const LineButton.xLarge({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          width: width,
          isDisabled: false,
        );

  const LineButton.xLargeDisabled({
    Key? key,
    required String text,
    double width = 128,
  }) : this(
          key: key,
          text: text,
          onPressed: null,
          width: width,
          isDisabled: true,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
