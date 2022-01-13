import 'dart:math';

import 'package:flutter/material.dart';

class NoteColors {
  NoteColors._();

  static final red = Colors.red[300];
  static final green = Colors.green[300];
  static final blue = Colors.blue[300];

  static List<Color> get _values => [red!, green!, blue!];

  static Color get random => _values[Random().nextInt(_values.length)];
}
