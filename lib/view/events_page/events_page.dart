import 'package:built_collection/built_collection.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/event_page/repository/event_firestore_repository.dart';
import 'package:republic_on_volga/domain/events/events_bloc.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/all_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/date_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/filter_command.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/search_filter_receiver.dart';
import 'package:republic_on_volga/domain/filter/filter_receiver.dart';
import 'package:republic_on_volga/model/article.dart';
import 'package:republic_on_volga/model/event.dart';
import 'package:republic_on_volga/model/event_screen_arguments.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:republic_on_volga/view/articles_widget.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/filter_listener.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';

import '../main_app_bar.dart';

class EventsPage extends StatelessWidget
    implements FilterListener, ArticleListener {
  BuildContext _context;
  TextEditingController _textEditingController = TextEditingController();
  BuiltList<Event> events;

  @override
  Widget build(BuildContext context) {
    return SinglePageWidget(
        appBar: MainAppBar(
          title: 'Мероприятия',
        ),
        body: BlocProvider<EventsBloc>(
          create: (context) =>
              EventsBloc(eventRepository: EventFirestoreRepository())
                ..add(GetEventsEvent()),
          child: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              _context = context;
              if (state is EventsData) {
                events = state.events;
                return Column(
                  children: [
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 6,
                    //         child: Container(
                    //           height: 50,
                    //           child: TextField(
                    //             controller: _textEditingController,
                    //             onChanged: (value) => onFilter(FilterOption.search),
                    //             decoration: InputDecoration(
                    //                 hintText: 'Найти',
                    //                 focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.all(Radius.circular(20)),
                    //                   borderSide: BorderSide(color: HexColor(primaryColor), width: 0.5),
                    //                 ),
                    //                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //           flex: 4,
                    //           child: PageMenu([
                    //             TextMenuItem('All', () => onFilter(FilterOption.all))..initWidget(),
                    //             AssetMenuItem(pathToIcon: 'assets/filter.svg', goToPage: () => onFilter(FilterOption.date))
                    //               ..initWidget(),
                    //           ]))
                    //     ],
                    //   ),
                    // ),
                    ArticlesWidget(
                      articles: state.events
                          .map((e) => Article(
                              title: e.title,
                              description: e.intro,
                              imgUrl: e.imgUrl,
                              date: e.date))
                          .toList(),
                      isPreview: false,
                      articleListener: this,
                    ),
                  ],
                );
              }
              if (state is ErrorEvents) {
                return ServerErrorWidget();
              } else {
                return ProgressWidget();
              }
            },
          ),
        ),
        selectedItemMenu: SelectedItemMenu(events: true));
  }

  @override
  onFilter(FilterOption filterOption) async {
    switch (filterOption) {
      case FilterOption.date:
        {
          final List<DateTime> picked = await DateRangePicker.showDatePicker(
              context: _context,
              initialFirstDate: new DateTime.now(),
              initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
              firstDate: new DateTime(2015),
              lastDate: new DateTime(DateTime.now().year + 2));
          if (picked != null && picked.length == 2) {
            print(picked);
          }
          FilterCommand(DateFilterReceiver(picked)).execute();
        }
        break;
      case FilterOption.all:
        {
          FilterCommand(AllFilterReceiver()).execute();
        }
        break;
      case FilterOption.search:
        {
          FilterCommand(SearchFilterReceiver(_textEditingController.text))
              .execute();
        }
        break;
    }
  }

  @override
  goToPage(int index) {
    Navigator.of(_context).pushNamed('/event',
        arguments: EventScreenArgument(event: events[index]));
    // print('go to page ${article.id}');
  }
}
