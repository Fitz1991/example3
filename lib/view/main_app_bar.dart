import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  Widget leading;

  MainAppBar({this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      backgroundColor: HexColor(backgroundColor),
      leading: leading,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(mainAppBarHeight);
}
