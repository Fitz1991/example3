import 'package:flutter/cupertino.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';

class VolgaStyle{
  static TextStyle primaryStyle(){
    return TextStyle(
      color: HexColor(primaryColor)
    );
  }

  static TextStyle secondaryStyle(){
    return TextStyle(
        color: HexColor(secondaryColor)
    );
  }
}