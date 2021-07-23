import 'package:flutter/material.dart';
import 'package:republic_on_volga/model/archive.dart';
import 'package:republic_on_volga/model/archive_screen_argument.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';

import '../single_page_widget.dart';

class ArchivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ArchiveScreenArgument archiveScreenArgument = ModalRoute.of(context).settings.arguments;
    Archive archive = archiveScreenArgument.archive;
    return SinglePageWidget(
        appBar: AppBar(
          title: Text('Архив'),
        ),
        body: Container(
          child: Column(
            children: [
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                children: [
                  // VolgaSlider(imgList),
                ],
              ),
            ],
          ),
        ),
        selectedItemMenu: SelectedItemMenu(archive: true));
  }
}
