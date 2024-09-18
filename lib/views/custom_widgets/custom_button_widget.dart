import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final int? height;
  final int? width;
  final Image? image;

  const ButtonWidget(
      {super.key, this.text,
        this.color,
        this.height,
        this.width,
        this.image
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }
}
