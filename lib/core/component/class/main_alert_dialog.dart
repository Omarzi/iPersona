
import 'package:flutter/material.dart';

class MainAlertDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? content;
  final Color bgColor;
  final List<Widget>? actions;
  final double circularBorderRadius;

  const MainAlertDialog({
    super.key,
    required this.title,
    this.message,
    this.content,
    this.bgColor = Colors.white,
    this.circularBorderRadius = 15.0,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: message != null ? Text(message!) : content,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularBorderRadius)),
        actions: actions);
  }
}
