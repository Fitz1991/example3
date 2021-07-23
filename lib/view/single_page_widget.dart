import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';

import 'menu.dart';

AppBar appBar;

class SinglePageWidget extends StatelessWidget {
  Widget appBar;
  Widget body;
  SelectedItemMenu selectedItemMenu;

  SinglePageWidget({@required this.body, this.appBar, @required this.selectedItemMenu});

  @override
  Widget build(BuildContext context) {
    // double height = screenHeight(context);
    appBar = appBar;
    return new LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(appBar: appBar, body: _SafeHeightWidget(body, selectedItemMenu, constraints.maxHeight));
    });
  }
}

class _SafeHeightWidget extends StatelessWidget {
  double maxHeight;
  Widget body;
  SelectedItemMenu selectedItemMenu;

  _SafeHeightWidget(this.body, this.selectedItemMenu, this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenCubit>(
      create: (context) => ScreenCubit()..getScreenHeight(maxHeight),
      child: BlocBuilder<ScreenCubit, ScreenState>(
        builder: (context, state) {
          if (state is ScreenHeight) {
            return Container(
              height: state.height,
              child: Stack(
                children: [
                  Container(
                    height: state.height - bottomMenuIndent - 40,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        body,
                      ),
                    ),
                  ),
                  Menu(selectedItemMenu)
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
