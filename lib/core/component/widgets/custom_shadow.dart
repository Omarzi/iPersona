import 'package:flutter/material.dart';

BoxShadow customShadow(
    {required double blurRadius,
    required double colorOpacity,
    required double offset}) {
  return BoxShadow(
      blurRadius: blurRadius,
      spreadRadius: 0,
      color: Colors.grey.withOpacity(colorOpacity),
      offset: Offset(0, offset));
}
