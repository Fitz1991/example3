import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/last_news_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/home_page/main/news.dart';

import '../../utils/timeout_handler.dart';

part 'last_news_event.dart';

part 'last_news_state.dart';

class LastNewsBloc extends Bloc<LastNewsEvent, LastNewsState> {
  LastNewsBloc({this.lastNewsRepository}) : super(LastNewsInitial());
  LastNewsRepository lastNewsRepository;

  @override
  Stream<LastNewsState> mapEventToState(
    LastNewsEvent event,
  ) async* {
    if (event is GetLastNews) yield* _getLastNews();
    if (event is SuccessLastNewsEvent)
      yield LastNewsData(lastNews: event.lastNews);
    if (event is ErrorLastNewsEvent)
      yield ErrorLastNews(message: event.message);
    if (event is LoadingLastNewsEvent) yield LoadingLastNews();
  }

  Stream<LastNewsState> _getLastNews() async* {
    add(LoadingLastNewsEvent());
    try {
      var lastNews = (lastNewsRepository.lastNews() as Stream<List<News>>);
      handleTimeout(lastNews, (err) => add(ErrorLastNewsEvent(message: err)));
      lastNews.listen((lastNews) {
        add(SuccessLastNewsEvent(lastNews: BuiltList.from(lastNews)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorLastNewsEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
