import 'package:built_collection/built_collection.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/home_page/main/repository/last_news_firestore_repository.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/all_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/date_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/filter_command.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/search_filter_receiver.dart';
import 'package:republic_on_volga/domain/filter/filter_receiver.dart';
import 'package:republic_on_volga/domain/home_page/last_news/last_news_bloc.dart';
import 'package:republic_on_volga/model/article.dart';
import 'package:republic_on_volga/model/home_page/main/news.dart';
import 'package:republic_on_volga/model/news_screen_argument.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/filter_listener.dart';
import 'package:republic_on_volga/view/progress_widget.dart';

import '../../articles_widget.dart';

class LastNewsPage extends StatelessWidget
    implements FilterListener, ArticleListener {
  BuildContext _context;

  BuiltList<News> lastNews;

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LastNewsBloc>(
      create: (context) =>
          LastNewsBloc(lastNewsRepository: LastNewsFirestoreRepository())
            ..add(GetLastNews()),
      child: BlocBuilder<LastNewsBloc, LastNewsState>(
        builder: (context, state) {
          _context = context;
          if (state is LastNewsData) {
            lastNews = state.lastNews;
            return
              // ListView.builder(itemBuilder: (context, index) =>
              //   Text('item $index'), itemCount: 100,);
              //
              ArticlesWidget(
              articles: state.lastNews
                  .map((e) => Article(
                      title: e.title,
                      description: e.description,
                      date: e.date,
                      imgUrl: e.slider.first.url))
                  .toList(),
              articleListener: this,
            );
          }
          if (state is ErrorLastNews) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
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
    Navigator.of(_context).pushNamed('/detail_last_news',
        arguments: NewsScreenArgument(news: lastNews[index], bloc:
        BlocProvider.of<LastNewsBloc>(_context)));
    // print('go to page ${article.id}');
  }
}
