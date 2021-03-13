import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.50) {
    return Theme.of(context).primaryColor;
  } else if (percent >= .25) return Colors.orange;

  return Colors.red;
}
