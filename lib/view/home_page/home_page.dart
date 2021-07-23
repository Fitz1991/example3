import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/screen_navigator/screen_navigator_bloc.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/home_page/main/main_home_page.dart';
import 'package:republic_on_volga/view/home_page/partners/partners.dart';
import 'package:republic_on_volga/view/home_page/suvenirs/suvenirs.dart';
import 'package:republic_on_volga/view/home_page/team/team.dart';
import 'package:republic_on_volga/view/home_page/tests/tests.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';

import '../page_menu.dart';
import 'last_news/last_news.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeScreenNavigatorBloc navigator;

  @override
  void dispose() {
    navigator.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenNavigatorBloc>(
      create: (context) => HomeScreenNavigatorBloc(),
      child: SinglePageWidget(
        appBar: HomeAppBar(),
        body: BlocBuilder<ScreenCubit, ScreenState>(
          builder: (context, state) {
            navigator = BlocProvider.of<HomeScreenNavigatorBloc>(context);
            if (state is ScreenHeight) {
              return Column(
                children: [
                  PageMenu(
                    [
                      AssetMenuItem(
                          pathToIcon: 'assets/news.svg',
                          toolTip: 'Последние новости',
                          goToPage: () => navigator.add(NavigateLastNewsScreen()))
                        ..initWidget(),
                      AssetMenuItem(
                          pathToIcon: 'assets/command.svg',
                          toolTip: 'Команда',
                          goToPage: () => navigator.add(NavigateCommandScreen()))
                        ..initWidget(),
                      AssetMenuItem(
                          pathToIcon: 'assets/partners.svg',
                          toolTip: 'Партнеры',
                          goToPage: () => navigator.add(NavigatePartnersScreen()))
                        ..initWidget(),
                      AssetMenuItem(
                          pathToIcon: 'assets/test.svg',
                          toolTip: 'Тесты',
                          goToPage: () => navigator.add(NavigateConcursScreen()))
                        ..initWidget(),
                      AssetMenuItem(
                          pathToIcon: 'assets/suvenirs.svg',
                          toolTip: 'Сувениры',
                          goToPage: () => navigator.add(NavigateSuvenirsScreen()))
                        ..initWidget(),
                    ],
                    bloc: BlocProvider.of<HomeScreenNavigatorBloc>(context),
                  ),
                  BlocBuilder<HomeScreenNavigatorBloc, HomeScreenNavigatorState>(
                    builder: (context, state) {
                      if (state is ScreenNavigatorInitial) {
                        return MainHomePageWidget();
                      }
                      if (state is LastNewsScreen) {
                        return LastNewsPage();
                      }
                      if (state is CommandScreen) {
                        return Team();
                      }
                      if (state is PartnersScreen) {
                        return PartnersWidget();
                      }
                      if (state is ConcursScreen) {
                        return TestsPage();
                      }
                      if (state is SuvenirsScreen) {
                        return SuvenirsWidget();
                      } else {
                        return Text('Страница не найдена');
                      }
                    },
                  )
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        selectedItemMenu: SelectedItemMenu(home: true),
      ),
    );
  }
}

class GoToMainHomePage extends StatefulWidget {
  const GoToMainHomePage({
    Key key,
  }) : super(key: key);

  @override
  _GoToMainHomePageState createState() => _GoToMainHomePageState();
}

class _GoToMainHomePageState extends State<GoToMainHomePage> {
  HomeScreenNavigatorBloc navigator;

  @override
  void initState() {
    navigator = BlocProvider.of<HomeScreenNavigatorBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: HexColor(primaryColor),
        size: 20,
      ),
      onPressed: () => navigator.add(NavigateInitialScreen()),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeScreenNavigatorBloc navigator;

  HomeAppBar();

  Widget leading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenNavigatorBloc, HomeScreenNavigatorState>(
      builder: (context, state) {
        navigator = BlocProvider.of<HomeScreenNavigatorBloc>(context);
        if (state is ScreenNavigatorInitial) {
          return MainAppBar(
            title: state.title,
          );
        }
        if (state is LastNewsScreen) {
          return MainAppBar(
            title: state.title,
            leading: GoToMainHomePage(),
          );
        }
        if (state is CommandScreen) {
          return MainAppBar(
            title: state.title,
            leading: GoToMainHomePage(),
          );
        }
        if (state is PartnersScreen) {
          return MainAppBar(
            title: state.title,
            leading: GoToMainHomePage(),
          );
        }
        if (state is ConcursScreen) {
          return MainAppBar(
            title: state.title,
            leading: GoToMainHomePage(),
          );
        }
        if (state is SuvenirsScreen) {
          return MainAppBar(
            title: state.title,
            leading: GoToMainHomePage(),
          );
        } else {
          return MainAppBar(
            title: state.title,
          );
        }
      },
    );

    //    AppBar(
    //   title: Text(
    //     title,
    //     style: Theme.of(context).textTheme.headline1,
    //   ),
    //   backgroundColor: HexColor(backgroundColor),
    //   leading: (title != 'Главная') ? (leading != null) ? leading :  null : null,
    // );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
