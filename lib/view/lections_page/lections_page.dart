import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/lessons/repository/lection_firestore_repository.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/lections/lection_bloc.dart';
import 'package:republic_on_volga/domain/volga_slider/volga_slider_bloc.dart';
import 'package:republic_on_volga/model/article_screen_argument.dart';
import 'package:republic_on_volga/model/assembly_master_classes.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/model/lection.dart';
import 'package:republic_on_volga/model/master_class_arguments.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/model/seminar.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/progress_widget.dart';

import '../single_page_widget.dart';
import '../volga_slider.dart';

class LectionsPage extends StatelessWidget implements ArticleListener {
  @override
  Widget build(BuildContext context) {
    return SinglePageWidget(
        appBar: MainAppBar(
          title: 'Лекции',
        ),
        body: BlocProvider<LectionBloc>(
          create: (context) =>
              LectionBloc(lectionRepository: LectionFirestoreRepository())
                ..add(GetLectionEvent()),
          child: BlocBuilder<LectionBloc, LectionState>(
            builder: (context, state) {
              if (state is LectionData) {
                return Column(
                  children: [
                    ...state.lections.map((lection) {
                      return MasterClassSliderWidget(
                          assemblyMasterClass: lection);
                    }).toList()
                  ],
                );
              }
              if (state is ErrorLection) {
                return ServerErrorWidget();
              } else {
                return ProgressWidget();
              }
            },
          ),
        ),
        selectedItemMenu: SelectedItemMenu(lection: true));
  }

  @override
  goToPage(int article) {}
}

class LectionSliderWidget extends StatefulWidget {
  @override
  _LectionSliderWidgetState createState() => _LectionSliderWidgetState();
}

class _LectionSliderWidgetState extends State<LectionSliderWidget>
    implements ArticleListener {
  List<Lection> _lections = [
    Lection(
        Timestamp.now(),
        lipsum.createWord(numWords: 30),
        '1',
        'https://www.youtube.com/watch?v=lur-PCLaYNQ&ab_channel=%D0%9E%D1%81%D1%82%D1%80%D1%8B%D0%B9%D0%A3%D0%B3%D0%BE%D0%BB',
        'Лекция'),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          //фабрика, создающая виджетвидно или фото, после вызова create
          Provider<VolgaItemForSliderFabric>(
            create: (context) => UrlPreviewVolgaFactory(
                videoVolgaSliderFabric: VideoVolgaFactory()),
          ),
          //мапим модели лекций
          Provider<List<VolgaSliderModel>>(
            create: (context) => _lections
                .map((e) => VolgaSliderModel((builder) => builder
                  ..url = e.imgUrl
                  ..title = e.title
                  ..desc = e.description))
                .toList(),
          ),
          //слушатель клика по элементу
          Provider<ArticleListener>(
            create: (context) => this,
          )
        ],
        builder: (context, child) {
          return Container(
            height: volgaSliderHeight,
            child: VolgaSlider(),
          );
        });
  }

  @override
  goToPage(int index) {
    Navigator.pushNamed(context, '/lection',
        arguments: ArticleScreenArgument(_lections[index]));
  }
}

class SeminarSliderWidget extends StatelessWidget implements ArticleListener {
  List<Seminar> _seminars = [
    Seminar(
        Timestamp.now(),
        lipsum.createWord(numWords: 30),
        '1',
        'https://www.youtube'
            '.com/watch?v=xpF9Ox7y_Zs&feature=emb_imp_woyt&ab_channel=%D0%A0%D0%B5%D1%81%D0%BF%D1%83%D0%B1%D0%BB%D0%B8%D0%BA%D0%B0'
            '%D0%BD%D0%B0%D0%92%D0%BE%D0%BB%D0%B3%D0%B5',
        'Семинар'),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<VolgaItemForSliderFabric>(
            create: (context) => UrlPreviewVolgaFactory(
                videoVolgaSliderFabric: VideoVolgaFactory()),
          ),
          Provider<List<VolgaSliderModel>>(
            create: (context) => _seminars
                .map((e) => VolgaSliderModel((builder) => builder
                  ..url = e.imgUrl
                  ..title = e.title
                  ..desc = e.description))
                .toList(),
          ),
          Provider<ArticleListener>(
            create: (context) => this,
          )
        ],
        builder: (context, child) {
          return Container(
            height: volgaSliderHeight,
            child: VolgaSlider(),
          );
        });
  }

  @override
  goToPage(int article) {
    // print(article.title);
  }
}

class MasterClassSliderWidget extends StatefulWidget {
  AssemblyMasterClasses assemblyMasterClass;

  MasterClassSliderWidget({this.assemblyMasterClass});

  @override
  _MasterClassSliderWidgetState createState() =>
      _MasterClassSliderWidgetState();
}

class _MasterClassSliderWidgetState extends State<MasterClassSliderWidget>
    implements ArticleListener {
  AssemblyMasterClasses assemblyMasterClass;

  @override
  void initState() {
    assemblyMasterClass = widget.assemblyMasterClass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<VolgaItemForSliderFabric>(
            create: (context) => UrlPreviewVolgaFactory(
                videoVolgaSliderFabric: VideoVolgaFactory()),
          ),
          Provider<ArticleListener>(
            create: (context) => this,
          )
        ],
        builder: (context, child) {
          return BlocProvider<VolgaSliderBloc>(
            create: (context) =>
                VolgaSliderBloc(BuiltList.from(assemblyMasterClass.lessons
                    .map((e) => VolgaSliderModel((builder) => builder
                      ..title = assemblyMasterClass.title
                      ..url = e.url
                      ..desc = e.title))
                    .toList())),
            child: VolgaSlider(height: 240,),
          );
        });
  }

  @override
  goToPage(int index) {
    Navigator.pushNamed(context, '/master_class',
        arguments: MasterClassArguments(
            parentTitle: assemblyMasterClass.title,
            parentUrl: assemblyMasterClass.url,
            masterClass: assemblyMasterClass.lessons[index]));
  }
}

class LectionBannerWidget extends StatelessWidget {
  const LectionBannerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          color: HexColor(secondaryColor),
        ),
        Positioned(
          child: Image.asset(
            'assets/lection_banner.png',
            height: 200,
          ),
        ),
        Positioned(
          child: Text(
            'Призыв учмить историю родного языка',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline2.fontSize,
                color: Colors.white),
          ),
          bottom: 50,
        )
      ],
    );
  }
}
