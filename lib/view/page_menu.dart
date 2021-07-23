import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/screen_navigator/screen_navigator_bloc.dart';

class PageMenu extends StatefulWidget {
  List<PageMenuItem> menuItems;
  HomeScreenNavigatorBloc bloc;

  PageMenu(this.menuItems, {this.bloc});

  @override
  _PageMenuState createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  List<PageMenuItem> menuItems;

  @override
  void initState() {
    menuItems = widget.menuItems;
    if (widget.bloc != null) {
      widget.bloc.listen((state) {
        if (state is ScreenNavigatorInitial)
          setState(() => {
                menuItems.map((e) {
                  e.active = false;
                  e.color = inactiveColor;
                  e.rebuild();
                  return e;
                }).toList(),
              });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: menuItems.map((e) => getMenu(context, menuItems.indexOf(e))).toList()),
    );
  }

  Widget getMenu(BuildContext context, int index) {
    return InkWell(
        onTap: () => {
              setState(() => {
                    menuItems.map((e) {
                      e.active = false;
                      e.color = inactiveColor;
                      e.rebuild();
                      return e;
                    }).toList(),
                    menuItems[index].active = true,
                    menuItems[index].color = activeColor,
                    menuItems[index].rebuild(),
                  }),
              menuItems[index].goToPage()
            },
        child: (menuItems[index].active == true)
            ? Container(
                decoration: BoxDecoration(
                    color: HexColor(primaryColor),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 45,
                width: 55,
                padding: EdgeInsets.all(10),
                child: Center(child: menuItems[index].widget),
              )
            : Container(
                height: 45,
                width: 55,
                padding: EdgeInsets.all(10),
                child: Center(child: menuItems[index].widget),
              ));
  }
}

class PageMenuItem {
  VoidCallback goToPage;
  String str;
  String toolTip;
  bool _active = false;
  String _color = inactiveColor;

  bool get active => _active;

  set active(bool value) {
    _active = value;
  }

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  Widget widget;

  initWidget() {}

  rebuild() {}

  PageMenuItem({this.str, this.goToPage});
}

class AssetMenuItem extends PageMenuItem {
  AssetMenuItem({String pathToIcon, this.toolTip, goToPage}) : super(str: pathToIcon, goToPage: goToPage);

  String toolTip;

  @override
  initWidget() {
    widget = (toolTip != null)
        ? Tooltip(
            message: toolTip,
            child: SvgPicture.asset(
              str,
              color: HexColor(inactiveColor),
            ),
          )
        : SvgPicture.asset(
            str,
            color: HexColor(inactiveColor),
          );
  }

  @override
  rebuild() {
    widget = (toolTip != null)
        ? Tooltip(
            message: toolTip,
            child: SvgPicture.asset(str, color: HexColor(_color)),
          )
        : SvgPicture.asset(str, color: HexColor(_color));
  }
}

class TextMenuItem extends PageMenuItem {
  TextMenuItem(String text, goToPage) : super(str: text, goToPage: goToPage);

  @override
  Widget initWidget() {
    widget = Text(
      str,
      style: TextStyle(color: HexColor(inactiveColor), fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget rebuild() {
    widget = Text(
      str,
      style: TextStyle(color: HexColor(_color), fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}
