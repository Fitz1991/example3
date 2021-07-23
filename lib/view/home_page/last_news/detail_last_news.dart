import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/last_news/last_news_bloc.dart';
import 'package:republic_on_volga/domain/home_page/main/main_bloc.dart';
import 'package:republic_on_volga/domain/volga_slider/volga_slider_bloc.dart';
import 'package:republic_on_volga/model/home_page/main/news.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/model/news_screen_argument.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';
import 'package:republic_on_volga/view/volga_slider.dart';
import 'package:simple_html_css/simple_html_css.dart';

class DetailLastNews extends StatefulWidget {
  @override
  _DetailLastNewsState createState() => _DetailLastNewsState();
}

class _DetailLastNewsState extends State<DetailLastNews> {
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  LastNewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    final NewsScreenArgument newsScreenArgument =
        ModalRoute.of(context).settings.arguments;
    News news = newsScreenArgument.news;
    bloc = newsScreenArgument.bloc;
    return BlocProvider<LastNewsBloc>(
      create: (context) => bloc,
      child: SinglePageWidget(
          appBar: MainAppBar(
              title: news.title,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: HexColor(primaryColor),
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              )),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 8,
                  children: [
                    MultiProvider(
                      providers: [
                        Provider<List<VolgaSliderModel>>(
                          create: (context) => news.slider
                              .map((e) => VolgaSliderModel(
                                  (builder) => builder..url = e.url))
                              .toList(),
                        ),
                        Provider<VolgaItemForSliderFabric>(
                          create: (context) => ImageVolgaFactory(),
                        ),
                        Provider<ArticleListener>(
                          create: (context) => null,
                        )
                      ],
                      builder: (context, child) {
                        return BlocProvider<VolgaSliderBloc>(
                          create: (context) => VolgaSliderBloc(news.slider),
                          child: Container(
                            height: volgaSliderHeight,
                            child: BlocListener<LastNewsBloc, LastNewsState>(
                              listener: (context, state) {
                                if (state is MainData)
                                  BlocProvider.of<VolgaSliderBloc>(context)
                                      .add(UpdateSlider(news.slider));
                              },
                              child: VolgaSlider(),
                            ),
                          ),
                        );
                      },
                    ),
                    Center(
                        child: Text(
                      '${news.title}',
                      style: Theme.of(context).textTheme.headline1,
                    )),
                    RichText(
                      text: HTML.toTextSpan(context, news.description,
                          defaultTextStyle:
                              Theme.of(context).textTheme.bodyText2),
                    ),
                  ],
                ),
              ],
            ),
          ),
          selectedItemMenu: SelectedItemMenu(events: true)),
    );
  }
}
