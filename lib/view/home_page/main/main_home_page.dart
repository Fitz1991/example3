import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/home_page/main/repository/main_firestore_repository.dart';
import 'package:republic_on_volga/data/home_page/main/repository/main_repository.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/main/main_bloc.dart';
import 'package:republic_on_volga/domain/volga_slider/volga_slider_bloc.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../article_listener.dart';
import '../../volga_slider.dart';

class MainHomePageWidget extends StatefulWidget {
  @override
  _MainHomePageWidgetState createState() => _MainHomePageWidgetState();
}

class _MainHomePageWidgetState extends State<MainHomePageWidget> {
  MainRepository mainFirestoreRepository = MainFirestoreRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) =>
          MainBloc(mainRepository: mainFirestoreRepository)..add(GetMain()),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainData) {
            return Column(
              children: [
                Banner(),
                SizedBox.fromSize(
                  size: Size.fromHeight(blocSpace),
                ),
                MultiProvider(
                  providers: [
                    Provider<VolgaItemForSliderFabric>(
                      create: (context) => ImageVolgaFactory(),
                    ),
                    Provider<ArticleListener>(
                      create: (context) => null,
                    )
                  ],
                  builder: (context, child) {
                    return BlocProvider<VolgaSliderBloc>(
                      create: (context) =>
                          VolgaSliderBloc(state.main.sliderWithDesc),
                      child: BlocListener<MainBloc, MainState>(
                        listener: (context, state) {
                          if (state is MainData)
                            BlocProvider.of<VolgaSliderBloc>(context)
                                .add(UpdateSlider(state.main.sliderWithDesc));
                        },
                        child: VolgaSlider(),
                      ),
                    );
                  },
                ),
                About(),
                SizedBox.fromSize(
                  size: Size.fromHeight(blocSpace),
                ),
                MultiProvider(
                  providers: [
                    Provider<VolgaItemForSliderFabric>(
                      create: (context) => ImageVolgaFactory(),
                    ),
                    Provider<ArticleListener>(
                      create: (context) => null,
                    )
                  ],
                  builder: (context, child) {
                    return BlocProvider<VolgaSliderBloc>(
                      create: (context) => VolgaSliderBloc(state.main.slider),
                      child: Container(
                        height: 300,
                        child: BlocListener<MainBloc, MainState>(
                          listener: (context, state) {
                            if (state is MainData)
                              BlocProvider.of<VolgaSliderBloc>(context)
                                  .add(UpdateSlider(state.main.slider));
                          },
                          child: VolgaSlider(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          if (state is ErrorMain) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainData) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                color: HexColor(primaryColor),
              ),
              Positioned(
                top: 25,
                right: 35,
                child: Image.asset(
                  'assets/logo.png',
                  height: 70,
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/banner.png',
                  height: 130,
                ),
                top: 90,
                left: 80,
              ),
              Positioned(
                child: Text(
                  state.main.slogan,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline2.fontSize,
                      color: Colors.white),
                ),
                bottom: 25,
              )
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainData) {
          return Container(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      runSpacing: headerSpace,
                      children: [
                        Text(
                          'О проекте',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        RichText(
                          text: HTML.toTextSpan(context, state.main.about),
                        ),
                      ],
                    ),
                  )));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
