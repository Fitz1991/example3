import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';

class ArrowBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: HexColor(primaryColor),
        size: 20,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
