import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';

typedef OnTap();

class VolgaOutlineButton extends StatelessWidget {
  VolgaOutlineButton({@required this.func, @required this.text, Key key}) :
        super(key: key);

  String text;
  OnTap func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: HexColor(primaryColor).withOpacity(0.55))
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Center(child: Text(text, style: Theme.of(context).textTheme
            .bodyText1,
        ),),
      ),
    );
  }
}
