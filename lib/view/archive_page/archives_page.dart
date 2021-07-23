import 'package:built_collection/built_collection.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/archive_page/repository/archive_firestore_repository.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/archive/archive_bloc.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/all_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/date_filter_receiver.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/filter_command.dart';
import 'package:republic_on_volga/domain/events/filter_implementations/search_filter_receiver.dart';
import 'package:republic_on_volga/domain/filter/filter_receiver.dart';
import 'package:republic_on_volga/model/archive.dart';
import 'package:republic_on_volga/model/article.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../articles_widget.dart';
import '../filter_listener.dart';
import '../single_page_widget.dart';

class ArchivesPage extends StatelessWidget
    implements FilterListener, ArticleListener {
  BuildContext _context;
  TextEditingController _textEditingController = TextEditingController();

  BuiltList<Archive> archives;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SinglePageWidget(
        appBar: MainAppBar(
          title: 'Архив',
        ),
        body: Column(
          children: [
            // Container(
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 6,
            //         child: Container(
            //           height: 50,
            //           child: searchWidget(),
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
            BlocProvider<ArchiveBloc>(
              create: (context) =>
                  ArchiveBloc(archiveRepository: ArchiveFirestoreRepository())
                    ..add(GetArchiveEvent()),
              child: BlocBuilder<ArchiveBloc, ArchiveState>(
                builder: (context, stateArchive) {
                  if (stateArchive is ArchiveData) {
                    archives = stateArchive.archives;
                    return ArticlesWidget(
                        articles: stateArchive.archives
                            .map((archive) => Article(
                                title: archive.title,
                                imgUrl: archive.imgUrl,
                                description: archive.description))
                            .toList(),
                        isPreview: false,
                        articleListener: this);
                  }
                  if (stateArchive is ErrorArchive) {
                    return ServerErrorWidget();
                  } else {
                    return ProgressWidget();
                  }
                },
              ),
            ),
          ],
        ),
        selectedItemMenu: SelectedItemMenu(archive: true));
  }

  TextField searchWidget() {
    return TextField(
      controller: _textEditingController,
      onChanged: (value) => onFilter(FilterOption.search),
      decoration: InputDecoration(
          hintText: 'Найти',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: HexColor(primaryColor), width: 0.5),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
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
    _launchInBrowser((archives[index]).url);
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
