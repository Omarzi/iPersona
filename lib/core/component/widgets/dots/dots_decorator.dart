import 'package:flutter/material.dart';

const Size kDefaultSize = Size.square(9.0);
const EdgeInsets kDefaultSpacing = EdgeInsets.all(6.0);
const ShapeBorder kDefaultShape = CircleBorder();

class DotsDecorator {
  final Color color;
  final List<Color> colors;
  final Color? activeColor;
  final List<Color> activeColors;
  final Size size;
  final List<Size> sizes;
  final Size activeSize;
  /// List of active dot size
  /// One size by dot
  ///
  /// @Default `Value of activeSize parameter applied to each dot`
  final List<Size> activeSizes;

  /// Inactive dot shape
  ///
  /// @Default `CircleBorder()`
  final ShapeBorder shape;

  /// List of inactive dot shape
  /// One shape by dot
  ///
  /// @Default `Value of shape parameter applied to each dot`
  final List<ShapeBorder> shapes;

  /// Active dot shape
  ///
  /// @Default `CircleBorder()`
  final ShapeBorder activeShape;

  /// List of active dot shapes
  /// One shape by dot
  ///
  /// @Default `Value of activeShape parameter applied to each dot`
  final List<ShapeBorder> activeShapes;

  /// Spacing between dots
  ///
  /// @Default `EdgeInsets.all(6.0)`
  final EdgeInsets spacing;

  const DotsDecorator({
    this.color = Colors.grey,
    this.colors = const [],
    this.activeColor,
    this.activeColors = const [],
    this.size = kDefaultSize,
    this.sizes = const [],
    this.activeSize = kDefaultSize,
    this.activeSizes = const [],
    this.shape = kDefaultShape,
    this.shapes = const [],
    this.activeShape = kDefaultShape,
    this.activeShapes = const [],
    this.spacing = kDefaultSpacing,
  });

  Color? getActiveColor(int index) {
    return activeColors.isNotEmpty ? activeColors[index] : activeColor;
  }

  Color getColor(int index) {
    return colors.isNotEmpty ? colors[index] : color;
  }

  Size getActiveSize(int index) {
    return activeSizes.isNotEmpty ? activeSizes[index] : activeSize;
  }

  Size getSize(int index) {
    return sizes.isNotEmpty ? sizes[index] : size;
  }

  ShapeBorder getActiveShape(int index) {
    return activeShapes.isNotEmpty ? activeShapes[index] : activeShape;
  }

  ShapeBorder getShape(int index) {
    return shapes.isNotEmpty ? shapes[index] : shape;
  }
}