import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/utils/date_formater.dart';
import 'package:republic_on_volga/domain/volga_slider/volga_slider_bloc.dart';
import 'package:republic_on_volga/model/event.dart';
import 'package:republic_on_volga/model/event_screen_arguments.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';
import 'package:republic_on_volga/view/volga_outline_button.dart';
import 'package:republic_on_volga/view/volga_slider.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:url_launcher/url_launcher.dart';

import '../article_listener.dart';
import '../main_app_bar.dart';
import '../single_page_widget.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EventScreenArgument articleScreenArgument =
        ModalRoute.of(context).settings.arguments;
    Event event = articleScreenArgument.event;
    return SinglePageWidget(
        appBar: MainAppBar(
          title: event.title,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: HexColor(primaryColor),
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                children: [
                  MultiProvider(
                    providers: [
                      Provider<BuiltList<VolgaSliderModel>>(
                        create: (context) => event.slider,
                      ),
                      Provider<VolgaItemForSliderFabric>(
                        create: (context) => ImageVolgaFactory(),
                      ),
                      Provider<ArticleListener>(
                        create: (context) => null,
                      )
                    ],
                    builder: (context, child) {
                      return Container(
                        height: volgaSliderHeight,
                        child: BlocProvider<VolgaSliderBloc>(
                          create: (context) => VolgaSliderBloc(event.slider),
                          child: VolgaSlider(),
                        ),
                      );
                    },
                  ),
                  Center(
                      child: Text(
                    '${event.title}',
                    style: Theme.of(context).textTheme.headline1,
                  )),
                  RichText(
                    text: HTML.toTextSpan(context, event.conditions,
                        defaultTextStyle:
                            Theme.of(context).textTheme.bodyText2),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Место проведения:',
                        style: Theme.of(context).textTheme.headline2,
                      )),
                      Expanded(
                          child: Center(
                              child: Text(
                        '${event.place}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Дата проведения:',
                        style: Theme.of(context).textTheme.headline2,
                      )),
                      Expanded(
                          child: Center(
                              child: Text(
                        timestampToDate(event.date),
                        style: Theme.of(context).textTheme.bodyText2,
                      ))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Время проведения:',
                        style: Theme.of(context).textTheme.headline2,
                      )),
                      Expanded(
                          child: Center(
                              child: Text(
                        timestampToTime(event.date),
                        style: Theme.of(context).textTheme.bodyText2,
                      ))),
                    ],
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100, top: 50),
                  child:
                  VolgaOutlineButton(
                    func: () => _launchInBrowser(event.link),
                    text: 'Зарегестрироваться',
                  )
                ),
              ),
            ],
          ),
        ),
        selectedItemMenu: SelectedItemMenu(events: true));
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
