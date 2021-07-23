import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';

class Menu extends StatefulWidget {
  SelectedItemMenu selectedItemMenu;

  Menu(this.selectedItemMenu);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double bottomPosition;
  double menuHeight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    menuHeight = height / 3;
    bottomPosition = bottomPosition ?? -menuHeight;
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      left: 0,
      bottom: bottomPosition,
      child: Container(
        color: HexColor(backgroundColor),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  debugPrint('onTap');
                  if (bottomPosition <= -menuHeight) {
                    setState(() {
                      bottomPosition = -50;
                    });
                  } else if (bottomPosition >= -50) {
                    setState(() {
                      bottomPosition = -menuHeight;
                    });
                  }
                },
                onPanEnd: (details) {
                  setState(() {
                    debugPrint((-details.velocity.pixelsPerSecond.dy - menuHeight).toString());
                    if ((-details.velocity.pixelsPerSecond.dy - menuHeight) >= -50)
                      bottomPosition = -50;
                    else if ((-details.velocity.pixelsPerSecond.dy - menuHeight) <= -menuHeight)
                      bottomPosition = -menuHeight;
                    else
                      bottomPosition = (-details.velocity.pixelsPerSecond.dy - menuHeight);
                  });
                },
                child: MenuButton()),
            Container(
              color: HexColor(backgroundColor),
              width: width,
              height: menuHeight,
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuItem(
                        assetName: 'assets/home.svg',
                        title: 'Главная',
                        isSelected: widget.selectedItemMenu.home,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/home');
                          _hideMenu();
                        },
                      ),
                      MenuItem(
                        assetName: 'assets/events.svg',
                        title: 'Мероприятия',
                        isSelected: widget.selectedItemMenu.events,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/events');
                          _hideMenu();
                        },
                      ),
                      MenuItem(
                        assetName: 'assets/archive.svg',
                        title: 'Архив',
                        isSelected: widget.selectedItemMenu.archive,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/archive');
                          _hideMenu();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(
                        assetName: 'assets/runes.svg',
                        title: 'Древние руны',
                        isSelected: widget.selectedItemMenu.runes,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/runes');
                          _hideMenu();
                        },
                      ),
                      MenuItem(
                        assetName: 'assets/lection.svg',
                        title: 'Лекции',
                        isSelected: widget.selectedItemMenu.lection,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/lections');
                          _hideMenu();
                        },
                      ),
                      MenuItem(
                        assetName: 'assets/contacts.svg',
                        title: 'Контакты',
                        isSelected: widget.selectedItemMenu.contacts,
                        goToPage: () {
                          Navigator.pushReplacementNamed(context, '/contacts');
                          _hideMenu();
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _hideMenu() {
    setState(() {
      bottomPosition = -menuHeight;
    });
  }
}

class MenuItem extends StatelessWidget {
  String assetName;
  String title;
  bool isSelected;
  Function goToPage;

  MenuItem({this.assetName, this.title, this.goToPage, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => goToPage(),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: (assetName != null)
                ? Tooltip(
                    message: title,
                    verticalOffset: 40,
                    preferBelow: false,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      color: HexColor('#EDD191'),
                      child: SvgPicture.asset(
                        assetName,
                        color: (isSelected) ? HexColor(primaryColor) : Colors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 60,
                    width: 60,
                  ),
          ),
        ),
        // SizedBox(height: 5,),
        // (title != null) ? Container(width: 70, child: Text(title, style: Theme.of(context).textTheme.headline3, softWrap: true,)) : SizedBox.shrink()
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        color: HexColor(backgroundColor),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(height: 4, width: 45, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
