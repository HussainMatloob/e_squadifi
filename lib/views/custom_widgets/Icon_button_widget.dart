import 'package:flutter/material.dart';
class IconButtonWidget extends StatelessWidget {
  final Color? iconButtonColor;
  final Icon? icon;
  const IconButtonWidget({
    super.key,
    this.iconButtonColor,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: iconButtonColor,
        onPressed: () {},
        icon: icon ?? Icon(Icons.arrow_forward));
  }
}
